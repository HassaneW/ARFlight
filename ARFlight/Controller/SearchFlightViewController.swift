//
//  ViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import UIKit
// netoyer core data
// swift lint
// 0 warning
// ajouter les 3 requetes get list of flight 2 airport / 2 villes
// exemple basic hardcoder de 2 requetes dans le vc qui marchent

class SearchFlightViewController: UIViewController {
    
//    @IBOutlet weak var departTown : UITextField!
//    @IBOutlet weak var arriveTown : UITextField!
//    @IBOutlet weak var departDate : UITextField!
//    @IBOutlet weak var arriveDate : UITextField!
    
    private let textField = UITextField()
    
    var flightArray : [Flight]?
    
//    var state
    
    //MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureDelegates()
        setUp()
        
        print("SEARCH")
        
//
//       
        //        NetworkServiceFlight.shared.getflightDetails(with: flightParams) { (result) in
        // TPODO
        //        }
        
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Private methods

    private func setUp() {
        NetworkServiceFlight.shared.getflight(with: "20210302+AT+0789") { (result) in
            switch result {
            case .success(let flight):
                print(flight)
            case .failure(let error):
            print("error")
            }
        }
        let startLabel = Date().timeIntervalSinceNow
        NetworkServiceFlight.shared.searchForFlight(startRange: "textField.text", endRange: "2021-03-03..", origin: "CDG", destination: "CMN") { (result) in
            // TEST
        }
        let flightParam = FlightParameters(id: "", startRange: "", endRange: "", departureCity: "", arrivalCity: "", origin: "", destination: "", pageSize: "", pageNumber: "")
        NetworkServiceFlight.shared.getsearchForFlight(with: flightParam)
//        NetworkServiceFlight.shared.getsearchForFlight{ [weak self] (flightArray) in
//            switch flightArray {
//            case .success(let flightArray):
//                print(flightArray)
//                self?.flightArray = flightArray
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
    
    private func configureDelegates() {
        //textField.delegate = self
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
        view.addSubview(titleLabel)
        // setup les views
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1.0),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 1.0),
        ])
    }
}
