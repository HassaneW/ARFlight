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
    let calendarView = CalendarView()
    let tripViewDepart = TripCityView(title: "Depart", image: UIImage(systemName: "airplane"))
    let tripViewArrive = TripCityView(title: "Arrive", image: UIImage(systemName: "airplane"))
    private let text = UILabel()
    private var flights : [Flight]?
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        //                configureDelegates()
        setUp()
    }
    //MARK: - Private methods
    private func fetchFlights() {
        guard let departureCity = tripViewDepart.textField.text else {
            // departure / arrival / date depart arrive
            // afficher alerte veuillez choisir une ville depart
            // start range = departureDate
            print("missing departure city")
            return
        }
        
        // MARK: - Network
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
        view.backgroundColor = UIColor.lightGray
        
        // MARK: - textField Depart
        tripViewDepart.textField.delegate = self
        tripViewDepart.textField.textAlignment = .center
        tripViewDepart.textField.placeholder = "Depart"
        
        text.text = "OR"
        text.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        text.textColor = .black
        text.textAlignment = .center
        text.font =  UIFont (name: "Helvetica Neue", size:30)
        text.adjustsFontForContentSizeCategory = true
        text.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - textField Arrive
        tripViewArrive.textField.delegate = self
        tripViewArrive.textField.textAlignment = .center
        tripViewArrive.textField.placeholder = "Arrive"
        
        //        let mapView = MKMapKit() // tiale fixe
        //        let tableView = UITableView() // le tout dans stackView
        // custom cell
        //
        
        // MARK: -  Button
        myButton.addTarget(self, action: #selector(submitSearch), for: .touchUpInside)
        myButton.title = "My button"
        
        // MARK: - ContentStackView
        let contentStackView = UIStackView(arrangedSubviews: [tripViewDepart, text, currentLocationView, tripViewArrive , calendarView, dateRouteView, myButton])
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = UIStackView.spacingUseSystem
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.setCustomSpacing(20, after: text)
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
        text.backgroundColor = .red
    }
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
}
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
        text.isHidden = true
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
