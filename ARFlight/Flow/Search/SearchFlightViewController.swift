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
    
    private let searchButton = ActionButton()
    let startDatePicker = SearchDatePicker(title: "Date Depart")
    let arriveDatePicker = SearchDatePicker(title: "Date Arrive")
    private var flights : [Flight]?
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        //                configureDelegates()
        setUp()
    }
    // MARK: - Action methods
    @objc
    func submitSearch() {
        fetchFlights()
    }
    //MARK: - Private methods
    
    private func fetchFlights() {
        guard let pickupDate = startDatePicker.selectedDate else {
            // Afficher une alerte qui dit que les donnes sont incompletes
            return
        }
        print(pickupDate) // "2021-01-14T10:00:00Z" ISO8601
        NetworkServiceFlight.shared.searchForFlight(startRange: "2021-01-14T10:00:00Z", endRange: "2021-01-20T23:59:00Z", origin: "YUL", destination: "CDG") { [weak self] result in
            switch result {
            case .success(let flights):
                print("Flights found: \(flights.count)")
                self?.flights = flights
                self?.coordinator?.showListResultController(with: flights)
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
    
    // MARK: - Actions
    
    @objc
    func searchForCurrentLocation(_ sender: UIButton) {
        print("search for current location tapped")
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

        let startTextField = SearchTextField()
        startTextField.delegate = self
        startTextField.placeholder = "Depart"
       
        let arriveTownTextField = SearchTextField()
        arriveTownTextField.delegate = self
        arriveTownTextField.placeholder = "Arrive"

        let searchCurrentLocationButton = SearchCurrentLocationButton()
        searchCurrentLocationButton.addTarget(self, action: #selector(searchForCurrentLocation), for: .touchUpInside)

        let orLabel = UILabel()
        orLabel.text = "OR"
        orLabel.font = .preferredFont(forTextStyle: .title3)
        orLabel.textColor = .label
        orLabel.textAlignment = .center
        orLabel.adjustsFontForContentSizeCategory = true
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        searchButton.title = "My button"
        searchButton.addTarget(self, action: #selector(submitSearch), for: .touchUpInside)
        
        let contentStackView = UIStackView(
            arrangedSubviews: [startSectionHeader,
                               startTextField,
                               orLabel,
                               searchCurrentLocationButton,
                               arriveSectionHeader,
                               arriveTownTextField,
                               calendarSectionHeader,
                               startDatePicker,
                               arriveDatePicker,
                               searchButton])
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = UIStackView.spacingUseSystem
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.setCustomSpacing(20, after: orLabel)
        contentStackView.setCustomSpacing(20, after: searchCurrentLocationButton)
        contentStackView.setCustomSpacing(30, after: arriveDatePicker)
        
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
