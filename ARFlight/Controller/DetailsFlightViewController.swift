//
//  DetailsFlightViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 23/02/2021.
//

import UIKit

class DetailsFlightViewController: UIViewController {

    // Infos Avions
    @IBOutlet weak var flightType : UILabel!
    @IBOutlet weak var id : UILabel!
    @IBOutlet weak var motorType : UILabel!
    @IBOutlet weak var numberOfSeats : UILabel!
    @IBOutlet weak var length : UILabel!
    @IBOutlet weak var cruisingSpeed : UILabel!
    @IBOutlet weak var image : UILabel!
    
    // Infos Vol
    /*
     "aircraftDetails": [
         {
             "flightType": "longHaul",
             "id": "AIRBUS A330-200",
             "motorType": "CF6-80E1A3",
             "numberOfSeats": "224",
             "length": 58.36,
             "cruisingSpeed": "M 0,82",
             "image": "a330-200"
         },
     */
    
    
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
