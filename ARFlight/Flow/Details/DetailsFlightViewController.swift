//
//  DetailsFlightViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 23/02/2021.
//

import UIKit

class DetailsFlightViewController: UIViewController {
    
    // MARK: - coordinator
    weak var coordinator: MainCoordinator?
    
    // MARK: - property View
    let companyFlightInfoView = CompanyFlightInfoView()
    let departView = AirportDetailView(flightLeg: "Depart")
    let arrivalView = AirportDetailView(flightLeg: "Arrived")
    let planeInformationView = PlaneInformationView()
//    let notificationCalendarView = NotificationCalendarView() // ?
    
    private let planes = Bundle.main.decode([Plane].self, from: "aircraft-details.json")
    private let flight: Flight
    
    // MARK: - SetUp

    init(flight: Flight) {
        self.flight = flight
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - View Configuration

extension DetailsFlightViewController {
    
    private func setupView() {
        title = "Rechercher un vol"
        view.backgroundColor = UIColor.systemBackground
        
        companyFlightInfoView.flight = flight
        
        departView.airportDetailInfo = (flight.departureCodeAirport, flight.departureDateTime?.timeString(), flight.departureTerminalAirport )
        arrivalView.airportDetailInfo = (flight.arrivalCodeAirport, flight.arrivalDateTime?.timeString(), flight.arrivalTerminalAirport)
 
        print("Plane Id \(flight.planeId ?? "Missing")")
        if let flightPlane = planes.first(where: { $0.id == flight.planeId }) {
            planeInformationView.plane = flightPlane
        }
        
        let contentStackView = UIStackView(arrangedSubviews: [companyFlightInfoView, departView,arrivalView, planeInformationView])
//        notificationCalendarView
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = 20
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let scrollView = UIScrollView()
        scrollView.addSubview(contentStackView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: scrollView.topAnchor, multiplier: 2),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: scrollView.leadingAnchor, multiplier: 1.5),
            scrollView.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.5),
            scrollView.bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0),
        ])
    }
}

