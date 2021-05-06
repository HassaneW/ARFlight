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
    private let myButton = ActionButton()
    let dateRouteView = DateTripView()
    let currentLocationView = LocationView()
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
        //        let formatter = DateFormatter()
        //        let dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .custom({ decoder -> Date in
        //            let container = try decoder.singleValueContainer()
        //            let dateString = try container.decode(String.self)
        //
        //            // Date format for departure date
        //            formatter.dateFormat = "yyyy-MM-dd"
        //            if let date = formatter.date(from: dateString) {
        //                return date
        //            }
        //            // Date format for flight informations
        //            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        //            if let date = formatter.date(from: dateString) {
        //                return date
        //            }
        //            throw DateError.invalidDateFormat
        //        })
        //
        //        let flightsResponse = Bundle.main.decode(Flights.self, from: "flights.json", dateDecodingStrategy: dateDecodingStrategy)
        //            //.decode(Flights.self, from: "flights.json")
        //
        //        print(flightsResponse.flights.first)
        //
        //
        //        let testFlight = Flight(code: "ABC", name: "COMPANY")
        //        let flights: [Flight] = [testFlight, testFlight,testFlight]
        
    }
    //MARK: - Private methods
    
    private func fetchFlights() {
//        guard let departureCity = tripViewDepart.textField.text else {
//            // departure / arrival / date depart arrive
//            // afficher alerte veuillez choisir une ville depart
//            // start range = departureDate
//            print("missing departure city")
//            return
//        }
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
    
    // MARK: - Set up
    // a supprimer
    private func setUp() {
        let planes = Bundle.main.decode([Plane].self, from: "aircraft-details.json")
        print(planes.first)
        
        let codeAirport = Bundle.main.decode(AirportName.self, from: "code-airport.json")
        print(codeAirport)
        
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
        
        let startTown = UITextField()
        let startTextField = SearchTextField(textfield: startTown)
        startTextField.searchPlaceHolder = "Depart"
        self.view.addSubview(startTextField)
        
        let arriveTown = UITextField()
        let arriveTownTextField = SearchTextField(textfield: arriveTown)
        arriveTownTextField.searchPlaceHolder = "Arrive"
        self.view.addSubview(arriveTownTextField)

        let searchCurrentLocationButton = SearchCurrentLocationButton()
        
        let orLabel = UILabel()
        orLabel.text = "OR"
        orLabel.font = .preferredFont(forTextStyle: .title3)
        orLabel.textColor = .black
        orLabel.textAlignment = .center
//        orLabel.font =  UIFont (name: "Helvetica Neue", size:30)
        orLabel.adjustsFontForContentSizeCategory = true
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let startDatePicker = SearchDatePicker(title: "Date Depart")
        let arriveDatePicker = SearchDatePicker(title: "Date Arrive")
        
        // MARK: -  Button
        myButton.addTarget(self, action: #selector(submitSearch), for: .touchUpInside)
        myButton.title = "My button"
        
        // MARK: - ContentStackView
        let contentStackView = UIStackView(arrangedSubviews: [startSectionHeader,startTextField, orLabel, searchCurrentLocationButton, arriveSectionHeader,arriveTownTextField, calendarSectionHeader, startDatePicker, arriveDatePicker, myButton])
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = UIStackView.spacingUseSystem
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.setCustomSpacing(20, after: orLabel)
        contentStackView.setCustomSpacing(20, after: currentLocationView)
        
        // MARK: - scrollView
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
// asupprimer ?
extension Flight {
    init(code: String?, name: String?) {
        self.company = Airline(code: code, name: name)
        self.flightNumber = nil
        self.departureDate = nil
        self.identifiantPlane = nil
        self.flightType = .long
        self.flightStatus = nil
        self.flightInformations = nil
    }
}
extension SearchFlightViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.isHidden = true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "." && (textField.text?.contains(".") == true) {
            return false
        }
        return true
    }
}
