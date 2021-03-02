//
//  DetailsFlightViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 23/02/2021.
//

import UIKit

class DetailsFlightViewController: UIViewController {

    // Infos Avions : ModelPlanes
    @IBOutlet weak var id : UILabel!
    @IBOutlet weak var motorType : UILabel!
    @IBOutlet weak var numberOfSeats : UILabel!
    @IBOutlet weak var length : UILabel!
    @IBOutlet weak var cruisingSpeed : UILabel!
    @IBOutlet weak var image : UILabel!
    
    // Infos Vol
    @IBOutlet weak var flightNumber : UILabel!
    @IBOutlet weak var departureDate : UILabel!
    @IBOutlet weak var identifiantPlane : UILabel!
    @IBOutlet weak var flightType : UILabel!
    @IBOutlet weak var companyCode : UILabel!
    @IBOutlet weak var companyName : UILabel!
    @IBOutlet weak var flightStatus : UILabel!
   
    // Depart
    @IBOutlet weak var departureTtimes : UILabel!
    @IBOutlet weak var departureAirportCode : UILabel!
    @IBOutlet weak var departureAirportName : UILabel!
    @IBOutlet weak var departureAirportCity : UILabel!
    @IBOutlet weak var departureAirportCountry : UILabel!
    @IBOutlet weak var departureLocation : UILabel!
    @IBOutlet weak var departurePlaces : UILabel!
    
    // Arrived
    @IBOutlet weak var arrivedTtimes : UILabel!
    @IBOutlet weak var arrivedAirportCode : UILabel!
    @IBOutlet weak var arrivedAirportName : UILabel!
    @IBOutlet weak var arrivedAirportCity : UILabel!
    @IBOutlet weak var arrivedAirportCountry : UILabel!
    @IBOutlet weak var arrivedLocation : UILabel!
    @IBOutlet weak var arrivedPlaces : UILabel!
    
    @IBOutlet weak var duration : UILabel!

    
    /*
     Info Vol
      Flight number : \(flightNumber),
      Departure Date : \(departureDate),
      identifiant vol : \(identifiantPlane),
      Flight statut : \(flightStatus),
      Company code : \(company?.code),
      Company name : \(company?.name),
      Flight type : \(flightType),

     Info Depart
     departure time: \(flightInformations?[0].departure?.times),
     Code airport :
     \(flightInformations?[0].departure?.airport?.code),
     Name Airport :
     \(flightInformations?[0].departure?.airport?.name),
     City Airport :
     \(flightInformations?[0].departure?.airport?.city),
     Country Airport :
     \(flightInformations?[0].departure?.airport?.country),
     Coordonnées Airport :
         Latitude :
     \(flightInformations?[0].departure?.airport?.location?.latitude),
             Longitude:
     \(flightInformations?[0].departure?.airport?.location?.longitude),
     Places :
             GateNumber :
     \(flightInformations?[0].departure?.airport?.places?.gateNumber),
             Terminal :
     \(flightInformations?[0].departure?.airport?.places?.terminal)/n,

     Info Arrivée :

     Arrival time: \(flightInformations?[0].arrival?.times),
     Code airport :
     \(flightInformations?[0].arrival?.airport?.code),
     Name Airport :
     \(flightInformations?[0].arrival?.airport?.name),
     City Airport :
     \(flightInformations?[0].arrival?.airport?.city),
     Country Airport :
     \(flightInformations?[0].arrival?.airport?.country),
     Coordonnées Airport :
         Latitude :
     \(flightInformations?[0].arrival?.airport?.location?.latitude),
             Longitude:
     \(flightInformations?[0].arrival?.airport?.location?.longitude),
     Places :
             GateNumber :
     \(flightInformations?[0].arrival?.airport?.places?.gateNumber),
             Terminal :
     \(flightInformations?[0].arrival?.airport?.places?.terminal)/n,

     Info Avion

     Model Avion :
     \(flightInformations?[0].aircraft?.model)

     Number Model Avion :
     \(flightInformations?[0].aircraft?.number)

     """
         }
     }
     */
    
    
    var flight: Flight?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpId()
        // Do any additional setup after loading the view.
    }
    

    func setUpId() {
//        NetworkServiceFlight.shared.getflight{ [weak self] (flight) in
//            switch flight {
//            case .success(let flight):
//                print(flight)
//                self?.flight = flight
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }

}
