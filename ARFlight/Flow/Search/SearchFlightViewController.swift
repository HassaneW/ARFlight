//
//  ViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import UIKit
import MapKit
import CoreLocation


class SearchFlightViewController: UIViewController  {
    weak var coordinator: MainCoordinator?
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
    
    private lazy var cityCodeDictionary: [String: String] = {
        let airportName = Bundle.main.decode(AirportName.self, from: "code-airport.json")
        return airportName.cityCode
    }()
    
    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.pausesLocationUpdatesAutomatically = true
        locationManager.delegate = self
        return locationManager
    }()
    
    private let searchButton = ActionButton()
    private let startDatePicker = SearchDatePicker(title: "Date Depart")
    private let arrivalDatePicker = SearchDatePicker(title: "Date Arrive")
    private let departureCityTextField = SearchTextField()
    private let arrivalCityTextField = SearchTextField()
    private let activityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        activityIndicatorView.isHidden = true
    }
    
    // MARK: - Action methods
    
    @objc
    func submitSearch() {
        fetchFlights()
    }
    
    //MARK: - Private methods

    private func fetchFlights() {
        
        let departureDate = startDatePicker.selectedDate
        let arrivalDate = arrivalDatePicker.selectedDate
        
        guard departureDate != arrivalDate else {
            presentErrorAlert(errorMessage: "departure date must be different than arrival date")
            return
        }

        guard departureDate < arrivalDate else {
            presentErrorAlert(errorMessage: "arrival date must be after departure date")
            return
        }
        
        let pickupDateString = "\(dateFormatter.string(from: departureDate))Z"
        let arrivalDateString = "\(dateFormatter.string(from: arrivalDate))Z"
        
        guard let departureCity = departureCityTextField.text?.lowercased(),
              let departureCityAirportCode = cityCodeDictionary[departureCity] else {
            presentErrorAlert(errorMessage: "Cant find the departure city airport please check for typo")
            return
        }
        
        guard let arrivalCity = arrivalCityTextField.text?.lowercased(),
              let arrivalCityAirportCode = cityCodeDictionary[arrivalCity] else {
            presentErrorAlert(errorMessage: "Cant find the arrival city airport please check for typo")
            return
        }
        
        startLoading()
        
        NetworkServiceFlight.shared.searchForFlight(
            startRange: pickupDateString,
            endRange: arrivalDateString,
            origin: departureCityAirportCode,
            destination: arrivalCityAirportCode) { [weak self] result in
            DispatchQueue.main.async {
                self?.stopLoading()
                switch result {
                case .success(let flights):
                    self?.coordinator?.showListResultController(with: flights)
                case .failure(.afError(let errors)):
                    self?.presentAlert(title: "\(errors.error?.name?.localizedLowercase ?? "We're sorry")",
                                       message: "\(errors.error?.description ?? "something wrong happened")")
                case .failure(let error):
                    print("Error searching for flight: \(error.localizedDescription)")
                    self?.presentErrorAlert(errorMessage: "Something wrong happened")
                }
            }
        }
    }

    private func startLoading() {
      
        activityIndicatorView.startAnimating()
        searchButton.isEnabled = false
        startDatePicker.isUserInteractionEnabled = false
        arrivalDatePicker.isUserInteractionEnabled = false
        departureCityTextField.isEnabled = false
        arrivalCityTextField.isEnabled = false
    }
    
    private func stopLoading() {
        activityIndicatorView.isHidden = true
        activityIndicatorView.stopAnimating()
        searchButton.isEnabled = true
        startDatePicker.isUserInteractionEnabled = true
        arrivalDatePicker.isUserInteractionEnabled = true
        departureCityTextField.isEnabled = true
        arrivalCityTextField.isEnabled = true
    }
    
    // MARK: - Actions
    
    @objc
    func searchForCurrentLocation(_ sender: UIButton) {
        print("search for current location tapped")

        guard CLLocationManager.locationServicesEnabled() else {
            print("Location services are disabled")
            return
        }
        
        let authorizationStatus: CLAuthorizationStatus?
        
        if #available(iOS 14.0, *) {
            authorizationStatus = locationManager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        
        switch authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            print("Location service are not available")
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        case .none:
            print("Authorization status is nil")
        @unknown default:
            print("Authorization status not handled")
        }
    }
    
    private func reverseGeocodeLocation(_ location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                print("Reverse geocode location error: \(error.localizedDescription)")
                return
            }

            guard let placemark = placemarks?.first,
                  let city = placemark.locality,
                  let country = placemark.country,
                  let isoCountryCode = placemark.isoCountryCode else {
                print("Cant find a suitable placemark")
                return
            }

            print("Placemark found: \(city) - \(country) - \(isoCountryCode)")
            
            self.departureCityTextField.text = city
        }
    }
    
    private func presentAlert(title: String, message: String?, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmationAction = UIAlertAction(title: "Ok", style: .default) { _ in
            completion?()
        }
        alertController.addAction(confirmationAction)
        present(alertController, animated: true)
    }
    
    private func presentErrorAlert(errorMessage: String, completion: (() -> Void)? = nil) {
        presentAlert(title: "We're sorry", message: errorMessage, completion: completion)
    }
}

// MARK: - Set up View

extension SearchFlightViewController {
    private func setupView() {
        title = "RECHERCHER UN VOL"
        view.backgroundColor = UIColor.systemBackground
        
        let startSectionHeader = SearchSectionHeader(leadingImage: UIImage(systemName: "airplane"), title: "Depart")
        let arriveSectionHeader = SearchSectionHeader(leadingImage: UIImage(systemName: "airplane"), title: "Arrive")
        
        let calendarSectionHeader = SearchSectionHeader(leadingImage: UIImage(systemName: "calendar.circle"), title: "Calendar")
        
        departureCityTextField.delegate = self
        departureCityTextField.placeholder = "Depart"
        
        arrivalCityTextField.delegate = self
        arrivalCityTextField.placeholder = "Arrive"
        
        let searchCurrentLocationButton = SearchCurrentLocationButton()
        searchCurrentLocationButton.addTarget(self, action: #selector(searchForCurrentLocation), for: .touchUpInside)
        
        let orLabel = UILabel()
        orLabel.text = "OR"
        orLabel.font = .preferredFont(forTextStyle: .title3)
        orLabel.textColor = .label
        orLabel.textAlignment = .center
        orLabel.adjustsFontForContentSizeCategory = true
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        
        searchButton.title = "Search"
        searchButton.addTarget(self, action: #selector(submitSearch), for: .touchUpInside)
        
        let contentStackView = UIStackView(
            arrangedSubviews: [startSectionHeader,
                               departureCityTextField,
                               orLabel,
                               searchCurrentLocationButton,
                               arriveSectionHeader,
                               arrivalCityTextField,
                               calendarSectionHeader,
                               startDatePicker,
                               arrivalDatePicker,
                               searchButton])
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = UIStackView.spacingUseSystem
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.setCustomSpacing(20, after: orLabel)
        contentStackView.setCustomSpacing(20, after: searchCurrentLocationButton)
        contentStackView.setCustomSpacing(30, after: arrivalDatePicker)
        
        let scrollView = UIScrollView()
        scrollView.addSubview(contentStackView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        activityIndicatorView.isHidden = true
        activityIndicatorView.hidesWhenStopped = false
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicatorView)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.5),
            scrollView.bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0),
            
            contentStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: scrollView.topAnchor, multiplier: 2),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: scrollView.leadingAnchor, multiplier: 1.5),
            
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        // Debug colors
        //        orLabel.backgroundColor = .red
    }
}

// MARK: - UITextField delegate

extension SearchFlightViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}

// MARK: - CLLocationManager delegate

extension SearchFlightViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        let authorizationStatus: CLAuthorizationStatus?
        if #available(iOS 14.0, *) {
            authorizationStatus = manager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        
        switch authorizationStatus {
        case .notDetermined:
            return
        case .denied, .restricted:
            print("Location service are not available")
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        case .none:
            print("Authorization status is nil")
        @unknown default:
            print("Authorization status not handled")
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else {
            print("Can't find a suitable location object")
            return
        }
        reverseGeocodeLocation(latestLocation)
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager error \(error.localizedDescription)")
        presentErrorAlert(errorMessage: "Can't find current user location")
    }
}

extension CLLocationManager {
    var currentLocation: CLLocation? {
        return location
    }
    
//    var authorizationGranted: Bool {
//        return CLLocationManager().authorizationGranted
//    }
}
