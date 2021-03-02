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
    
    @IBOutlet weak var departTown : UITextField!
    @IBOutlet weak var arriveTown : UITextField!
    @IBOutlet weak var departDate : UITextField!
    @IBOutlet weak var arriveDate : UITextField!
    
    var flightArray : [Flight]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
        print("SEARCH")
        
//
//        let flightParams = FlightParameters(id: <#String#>, startRange: "", endRange: "", departureCity: "", arrivalCity: "", origin: "", destination: "", pageSize: "", pageNumber: "")
        //        NetworkServiceFlight.shared.getflightDetails(with: flightParams) { (result) in
        // TPODO
        //        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func setUp() {
        NetworkServiceFlight.shared.getsearchForFlight{ [weak self] (flightArray) in
            switch flightArray {
            case .success(let flightArray):
                print(flightArray)
                self?.flightArray = flightArray
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
}

