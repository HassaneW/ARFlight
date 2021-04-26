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
    let companyView = CompanyView()
    let flightInfoView = FlightInfoView()
    let departView = DepartView()
    let departTerminalView = DepartTerminalView()
    let arrivalView = ArrivalView()
    let arrivalTerminalView = ArrivalTerminalView()
    let planeView = PlaneView() // Flight id
    let infoPlaneView = InfoPlaneView()
    let notificationCalendarView = NotificationCalendarView()
    
    
    private let planes = Bundle.main.decode([Plane].self, from: "aircraft-details.json")
    private let flight: Flight?
    
    // MARK: - SetUp
    func setupFlightInformations() {
        companyView.titleCompany = flight?.company?.name
        companyView.titleCodeFlight = flight?.identifiantPlane
        companyView.titleFlightType = flight?.flightType.rawValue
        
        flightInfoView.titleStatus = flight?.flightStatus
        flightInfoView.titleDuree = flight?.durationFlight
        
        departView.titleDepartAirport = flight?.departureCodeAirport
        departView.titleHour = flight?.departureDateTime?.timeString()
        departTerminalView.titleDepartTerminalAirport = flight?.departureTerminalAirport
        
        arrivalView.titleArrivalAirport = flight?.arrivalCodeAirport
        arrivalView.titleHour = flight?.arrivalDateTime?.timeString()
        arrivalTerminalView.titleArrivalTerminalAirport = flight?.arrivalTerminalAirport ?? " - "
        
        planeView.titleFlight = flight?.flightNumber
        print("Plane Id \(flight?.planeId ?? "Missing")")
        if let flightPlane = planes.first(where: { $0.id == flight?.planeId }) {
            infoPlaneView.plane = flightPlane
        }
    }
    init(flight: Flight?) {
        self.flight = flight
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFlightInformations()
        setupView()
    }
    /*
     func fetchFlightDetails() {
     
     guard let flightId = flight?.identifiantPlane else {
     print("Missing flight Id")
     return
     }
     // loading / error / affichage
     
     NetworkServiceFlight.shared.getFlightDetailsFor(flightId: flightId) { (result) in
     switch result {
     case .success(let flight):
     print("Flight detail: \(flight)")
     DispatchQueue.main.async {
     self.flight = flight
     
     }
     case .failure(let error):
     print("Error getting flight details: \(error.localizedDescription)")
     }
     }
     }
     */
}

// MARK: - setupView
extension DetailsFlightViewController {
    private func setupView() {
        title = "Rechercher un vol"
        view.backgroundColor = UIColor.lightGray
        
        // MARK: - contentStackView
        let contentStackView = UIStackView(arrangedSubviews: [companyView, flightInfoView, departView,departTerminalView,arrivalView, arrivalTerminalView,planeView, infoPlaneView, notificationCalendarView])
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
            scrollView.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.5),
            scrollView.bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0),
            
            contentStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: scrollView.topAnchor, multiplier: 2),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: scrollView.leadingAnchor, multiplier: 1.5)      
        ])
    }
}

