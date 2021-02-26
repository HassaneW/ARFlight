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

    override func viewDidLoad() {
        super.viewDidLoad()
        print("SEARCH")
        
        let flightParams = FlightParameters(startRange: "", endRange: "", departureCity: "", arrivalCity: "", origin: "", destination: "", pageSize: "", pageNumber: "")
        NetworkServiceFlight.shared.getflightDetails(with: flightParams) { (result) in
            // TPODO
        }
        
        // Do any additional setup after loading the view.
    }


}

