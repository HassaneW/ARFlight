//
//  DetailsFlightViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 23/02/2021.
//

import UIKit

class DetailsFlightViewController: UIViewController {

    var flight: Flight?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpId()
        // Do any additional setup after loading the view.
    }
    

    func setUpId() {
        NetworkServiceFlight.shared.getflight{ [weak self] (flight) in
            switch flight {
            case .success(let flight):
                print(flight)
                self?.flight = flight
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
