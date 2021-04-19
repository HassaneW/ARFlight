//
//  DetailsFlightViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 23/02/2021.
//

import UIKit

class DetailsFlightViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    
    let companyView = CompanyView()
    let flightInfoView = FlightInfoView()
    
    let departView = DepartView()
    let departTerminalView = DepartTerminalView()
    
    let arrivalView = ArrivalView()
    let arrivalTerminalView = ArrivalTerminalView()
   
    let planeView = PlaneView() // Flight id
    let infoPlaneView = InfoPlaneView()
    let infoPlaneViewVL = InfoPlaneViewVitesseLongeur()
    
    let notificationCalendarView = NotificationCalendarView()

    let plane = Plane(flightType: "", id: "", motorType: "", numberOfSeats: "", length: 0.0, cruisingSpeed: "", image: "a330-200")
    
    private let planes = Bundle.main.decode([Plane].self, from: "aircraft-details.json")
    var flight: Flight? {
        didSet {
            configureView()
        }
    }
    
    
    /*
     company, identifiantPlane, flightType
     */
    
    func configureView() {

        
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
        let plane = planes.first {
            $0.id == flight?.planeId
            
        }
        
        infoPlaneView.titleTypeMoteur = planes.first?.motorType

        
        infoPlaneView.titleNombreDeSiege = planes.first?.numberOfSeats
        
        infoPlaneViewVL.titleLongeur = "\(planes.first!.length)"
        
        infoPlaneViewVL.titleVitesse = planes.first?.cruisingSpeed
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpId()
        
        setupView()
        // Do any additional setup after loading the view.
    }
    

    func setUpId() {
   
        // loading / error / affichage
        
        NetworkServiceFlight.shared.getFlightDetailsFor(flightId: "20210115+AF+1496") { (result) in
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

}

extension DetailsFlightViewController {
    
    private func setupView() {
        title = "Rechercher un vol"

        view.backgroundColor = UIColor.lightGray

        planeView.titleFlight = "\(flight?.identifiantPlane)"
        
//        if imageName = plane.image {
        planeView.image = UIImage(named: plane.image)
//        }
        
        
        
////        let myButton = ActionButton()
//        myButton.addTarget(self, action: #selector(submitSearch), for: .touchUpInside)
//       // myButton.addTarget(self, selector: #selector)
//        myButton.title = "My button"
//
        let contentStackView = UIStackView(arrangedSubviews: [companyView, flightInfoView, departView,departTerminalView,arrivalView, arrivalTerminalView,planeView, infoPlaneView, infoPlaneViewVL, notificationCalendarView])
        
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = UIStackView.spacingUseSystem
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


