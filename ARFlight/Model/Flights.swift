//
//  Flights.swift
//  ARFlight
//
//  Created by Wandianga hassane on 12/03/2021.
//

import Foundation


struct Flights: Decodable {
    let flights : [Flight]

    private enum CodingKeys : String, CodingKey {
        case flights = "operationalFlights"
    }
}

