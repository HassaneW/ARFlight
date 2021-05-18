//
//  ViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import UIKit
import MapKit

class SearchFlightViewController: UIViewController{
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
    
    private let searchButton = ActionButton()
    private let startDatePicker = SearchDatePicker(title: "Date Depart")
    private let arrivalDatePicker = SearchDatePicker(title: "Date Arrive")
    private let departureCityTextField = SearchTextField()
    private let arrivalCityTextField = SearchTextField()
    
    private var flights : [Flight]?
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setUp()
    }
    
    // MARK: - Action methods
    
    @objc
    func submitSearch() {
        fetchFlights()
    }
    
    //MARK: - Private methods
    
    private func indicator() {
        //Create Activity Indicator
        let myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
             
             // Position Activity Indicator in the center of the main view
             myActivityIndicator.center = view.center
             
             // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
             myActivityIndicator.hidesWhenStopped = false
             
             // Start Activity Indicator
             myActivityIndicator.startAnimating()
             
             // Call stopAnimating() when need to stop activity indicator
             //myActivityIndicator.stopAnimating()
             
             view.addSubview(myActivityIndicator)
        
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    private func fetchFlights() {
        
        indicator()
        
        let departureDate = startDatePicker.selectedDate
        let arrivalDate = arrivalDatePicker.selectedDate
    
        guard departureDate != arrivalDate else {
            print("departure date must be different than arrival date")
            // presentAlertForError("pick up date must be different than arrival date")
            factorisationErrorMessage(messageError: "pick up date must be different than arrival date")
            return
        }
        guard departureDate < arrivalDate else {
            factorisationErrorMessage(messageError:"arrival date must be after departure date")
            return
        }
        
        let pickupDateString = "\(dateFormatter.string(from: departureDate))Z"
        let arrivalDateString = "\(dateFormatter.string(from: arrivalDate))Z"
        
        guard let departureCity = departureCityTextField.text?.lowercased(),
              let departureCityAirportCode = cityCodeDictionary[departureCity] else {
            print("Cant find the departure city airport please check for typo")
            return
        }
        
        guard let arrivalCity = arrivalCityTextField.text?.lowercased(),
              let arrivalCityAirportCode = cityCodeDictionary[arrivalCity] else {
            print("Cant find the arrival city airport please check for typo")
            return
        }

        NetworkServiceFlight.shared.searchForFlight(startRange: pickupDateString, endRange: arrivalDateString, origin: departureCityAirportCode, destination: arrivalCityAirportCode) { [weak self] result in
            switch result {
            case .success(let flights):
                print("Flights found: \(flights.count)")
                self?.flights = flights
                self?.coordinator?.showListResultController(with: flights)
            case .failure(.afError(let errors)):
                print("Title: \(errors.error?.name?.localizedLowercase ?? "We're sorry")")
                print("Body \(errors.error?.description ?? "something wrong happened")")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    private func setUp() {
        let planes = Bundle.main.decode([Plane].self, from: "aircraft-details.json")
        print(planes.first)
        let codeAirport = Bundle.main.decode(AirportName.self, from: "code-airport.json")
        print(codeAirport)
    }
    
    private func airportName(nameAiport: String) -> String {
        let codeAirport = Bundle.main.decode(AirportName.self, from: "code-airport.json")
        let searchTextField = SearchTextField()


        return ""
    }
    
    // MARK: - Actions
    
    @objc
    func searchForCurrentLocation(_ sender: UIButton) {
        print("search for current location tapped")
    }
    
    private func factorisationErrorMessage(messageError: String) {
        let alertVC = UIAlertController(title: "ERROR!", message: messageError, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
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
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.5),
            scrollView.bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0),
            
            contentStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: scrollView.topAnchor, multiplier: 2),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: scrollView.leadingAnchor, multiplier: 1.5)
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

/*
 Code dateformatter :
 
 let formatter = DateFormatter()
 formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
 guard let date = formatter.date(from: pickupDate) else { return  }
 let dateDepart = formatter.string(from: date)
 print(dateDepart) // "2021-01-14T10:00:00Z" ISO8601
 */




/*
 //        NetworkServiceFlight.shared.getFlightDetailsFor(flightId: "20210115+AF+1496") { (result) in
 //            switch result {
 //            case .success(let flight):
 //                print("Flight detail: \(flight)")
 //                DispatchQueue.main.async {
 //                    self.flight = flight
 //                }
 //            case .failure(let error):
 //                print("Error getting flight details: \(error.localizedDescription)")
 //            }
 //        }
 
 */
