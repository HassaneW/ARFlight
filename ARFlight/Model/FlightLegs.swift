//
//  FlightLegs.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import Foundation



struct FlightLegs: Decodable {
    let departure: Information?
    let arrival: Information?
    let duration: String?
    let aircraft: Aircraft?
    
    private enum CodingKeys : String, CodingKey {
        case departure = "departureInformation"
        case arrival = "arrivalInformation"
        case duration = "scheduledFlightDuration"
        case aircraft
    }
}
