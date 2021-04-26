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
    
    // MARK: - property
    let companyView = CompanyView()
    let flightInfoView = FlightInfoView()
    
    let departView = DepartView()
    let departTerminalView = DepartTerminalView()
    
    let arrivalView = ArrivalView()
    let arrivalTerminalView = ArrivalTerminalView()
   
    // PlaneInformationsView
    let planeView = PlaneView() // Flight id
    let infoPlaneView = InfoPlaneView()
//    let infoPlaneViewVL = InfoPlaneViewVitesseLongeur()
    
    let notificationCalendarView = NotificationCalendarView()
    
    private let planes = Bundle.main.decode([Plane].self, from: "aircraft-details.json")
    
//    var flight: Flight? {
//        didSet {
//            print("Flight detail: \(flight)")
//            configureView()
//        }
//    }
    
    private let flight: Flight?
    
    /*
     company, identifiantPlane, flightType
     */
    
    func setupFlightInformations() {

        
        // Company
        companyView.titleCompany = flight?.company?.name
        
        companyView.titleCodeFlight = flight?.identifiantPlane
        
        companyView.titleFlightType = flight?.flightType.rawValue
            
        // Status, Duree
        
        flightInfoView.titleStatus = flight?.flightStatus
        
        flightInfoView.titleDuree = flight?.durationFlight
        
        
        // Depart
        departView.titleDepartAirport = flight?.departureCodeAirport
        
        departView.titleHour = flight?.departureDateTime?.timeString()
        
        departTerminalView.titleDepartTerminalAirport = flight?.departureTerminalAirport
 
        // Arrival
        arrivalView.titleArrivalAirport = flight?.arrivalCodeAirport
        
        arrivalView.titleHour = flight?.arrivalDateTime?.timeString()
        
        arrivalTerminalView.titleArrivalTerminalAirport = flight?.arrivalTerminalAirport ?? " - "
        
 // PlaneView
        
        planeView.titleFlight = flight?.flightNumber
       
        //        let plane = planes.first { (plane) -> Bool in
//            flight?.planeId == plane.id
        //        }
        //let plane = planes.first { $0.id == flight?.planeId }
        
        print("Plane Id \(flight?.planeId ?? "Missing")")
        
        if let flightPlane = planes.first(where: { $0.id == flight?.planeId }) {
            //infoPlaneView.isHidden = false
            infoPlaneView.plane = flightPlane
            
//            planeView.titleFlight = flightPlane.id
//
//            planeView.image = UIImage(named: flightPlane.image)
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

extension DetailsFlightViewController {
    
    private func setupView() {
        title = "Rechercher un vol"

        view.backgroundColor = UIColor.lightGray

      
        
        
      //  infoPlaneView.isHidden = true
////        let myButton = ActionButton()
//        myButton.addTarget(self, action: #selector(submitSearch), for: .touchUpInside)
//       // myButton.addTarget(self, selector: #selector)
//        myButton.title = "My button"
//
        let contentStackView = UIStackView(arrangedSubviews: [companyView, flightInfoView, departView,departTerminalView,arrivalView, arrivalTerminalView,planeView, infoPlaneView])
        
//        notificationCalendarView
        
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = 20
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
//        view.addSubview(contentStackView)
        
        // setup les views(
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
            scrollView.bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0)

            
        ])
        
//
//        // Debug colors
//        text.backgroundColor = .red
//
//        // Current Location
//
//
//    }
//
//    @objc
//    func submitSearch() {
//        let testFlight = Flight(code: "ABC", name: "COMPANY")
//        let flights: [Flight] = [testFlight, testFlight,testFlight]
//        coordinator?.showListResultController(with: flights)
    }
}

//extension Flight {
//    init(code: String?, name: String?) {
//        self.company = Airline(code: code, name: name)
//        self.flightNumber = nil
//        self.departureDate = nil
//        self.identifiantPlane = nil
//        self.flightType = .long
//        self.flightStatus = nil
//        self.flightInformations = nil
//    }
//}

//extension DetailsFlightViewController: UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        text.isHidden = true
//    }
//}


