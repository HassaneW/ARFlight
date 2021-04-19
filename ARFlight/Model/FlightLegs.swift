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
    
    var departureAirportName: String? {
        departure?.airport?.name
    }
    
    var arrivalAirportName: String? {
        arrival?.airport?.name
    }
    
    var departPlacesTerminal: String? {
        departure?.airport?.places?.gateNumbers
    }
    
    var departureDateTime: Date? {
        departure?.times?.scheduled
    }
    
    var arrivalPlacesTerminal: String? {
        arrival?.airport?.places?.gateNumbers
    }
    
    var arrivalDateTime: Date? {
        arrival?.times?.scheduled
    }
}

extension FlightLegs: CustomStringConvertible {
    var description: String {
        guard let departure = departure, let arrival = arrival, let duration = duration, let aircraft = aircraft else { return "Missing infos for aircraft"}
        return "FlightLegs: departure:\(departure), arrival: \(arrival), duration \(duration), aircraft : \(aircraft)"
    }
}

