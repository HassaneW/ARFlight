//
//  Location.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import Foundation


struct Location: Decodable {
    let latitude: Double?
    let longitude: Double?
    
}

extension Location: CustomStringConvertible {
    var description: String {
        guard let latitude = latitude, let longitude = longitude else { return "Missing infos for aircraft"}
        return "Location latitude \(latitude), longitude: \(longitude)"
    }
}

