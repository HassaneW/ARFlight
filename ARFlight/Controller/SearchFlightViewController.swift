//
//  ViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import UIKit

class SearchFlightViewController: UIViewController {
    
    //    @IBOutlet weak var departTown : UITextField!
    //    @IBOutlet weak var arriveTown : UITextField!
    //    @IBOutlet weak var departDate : UITextField!
    //    @IBOutlet weak var arriveDate : UITextField!
    
    //    private let textField = UITextField()
    //    var flightArray : [Flight]?
    //    var state
    
    var flight : Flight?
    var flightArray : [Flight]?
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        //                configureDelegates()
        
        print("SEARCH1")
        setUp()
        print("SEARCH2")
        
    }
    
    //MARK: - Private methods
    
    private func setUp() {
        
        let planes = Bundle.main.decode([Plane].self, from: "aircraft-details.json")
        print(planes.first)
        
        let codeAirport = Bundle.main.decode(AirportName.self, from: "code-airport.json")
        print(codeAirport)
        
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
        
            NetworkServiceFlight.shared.searchForFlight(startRange: "2021-01-14T10:00:00Z", endRange: "2021-01-20T23:59:00Z", origin: "DSS", destination: "CDG") { [weak self] (resultflight) in
                switch resultflight {
                case .success(let flights):
                    print("Flights found: \(flights)")
                    self?.flightArray = flights
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}

extension SearchFlightViewController {
    
    private func setupView() {
        title = "Rechercher un vol"
        
        view.backgroundColor = UIColor.purple
        
        let titleLabel = UILabel()
        titleLabel.text = "Lieu de départ"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.textColor = .cyan
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let textField = UITextField()
        textField.placeholder = "PLACEHOLDER"
        
        let contentStackView = UIStackView(arrangedSubviews: [titleLabel, textField])
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = UIStackView.spacingUseSystem
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(contentStackView)
        // setup les views(

        NSLayoutConstraint.activate([
            
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 3.0),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 3.0),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 3.0),
        ])
    }
}


/*
 Controller
 
 // 1
 
 
 // 2
 //        let startLabel = Date().timeIntervalSinceNow
 //        let startLabel = "dateDepart"
 //        let endLabel = "datearrivée"
 //        let originLabel = "aeroportDepart"
 //        let destinationLabel = "aeroportArrivée"
 //
 //        NetworkServiceFlight.shared.searchForFlight(startRange: startLabel, endRange: endLabel, origin: originLabel, destination: destinationLabel) { (result) in
 //            switch result {
 //            case .success(let flight):
 //                print(flight)
 //            case .failure(let error):
 //            print("error")
 //            }
 //        }
 
 //        NetworkServiceFlight.shared.searchForFlight(startRange: "textField.text", endRange: "2021-03-03..", origin: "CDG", destination: "CMN") { (result) in
 //            // TEST
 //        }
 
 // 3
 //        let flightParam = FlightParameters(id: "", startRange: "", endRange: "", departureCity: "", arrivalCity: "", origin: "", destination: "", pageSize: "", pageNumber: "")
 //        NetworkServiceFlight.shared.getsearchForFlight(with: flightParam)
 
 //        NetworkServiceFlight.shared.getsearchForFlight{ [weak self] (flightArray) in
 //            switch flightArray {
 //            case .success(let flightArray):
 //                print(flightArray)
 //                self?.flightArray = flightArray
 //            case .failure(let error):
 //                print(error.localizedDescription)
 //            }
 //        }
 
 
 
 //    private func configureDelegates() {
 //        //textField.delegate = self
 //    }
 
 
 // 4
 //        NetworkServiceFlight.shared.searchForFlight(startRange: "Date Depart", endRange: "2021-01-20T23:59:00Z", origin: "CDG", destination: "Airport Arrivée") { [weak self] (resultFight) in
 //
 //            switch resultFight  {
 //            case .success(let flights) where
 //                    flights.isEmpty:
 //                print("No Flight")
 //            case .success(let flights):
 //                print(flights)
 //                self?.flightArray = flights
 //            case .failure(let error):
 //                print("Error searching for flights: \(error.localizedDescription)")
 //            }
 //        }
 
 //                let flightParam = FlightParameters(id: "20210115+AF+1496", startRange: "2021-01-14T10:00:00Z", endRange: "2021-01-20T23:59:00Z", departureCity: "DKR", arrivalCity: "PAR")
 //        NetworkServiceFlight.shared.getsearchForFlight(with: flightParam)
 
 //        print(flightArray?.count)
 
 
 //
 //
 //        NetworkServiceFlight.shared.getflightDetails(with: flightParams) { (result) in
 // TPODO
 //        }
 
 
 // Do any additional setup after loading the view.
 
 */
