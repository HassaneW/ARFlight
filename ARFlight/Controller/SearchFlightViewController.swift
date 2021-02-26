//
//  ViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import UIKit

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

