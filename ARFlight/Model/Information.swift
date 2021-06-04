//
//  Information.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import Foundation



struct Information: Decodable {
    let airport : Airport?
    let times: Times?
}

extension Information: CustomStringConvertible {
    var description: String {
        guard let airport = airport, let times = times else { return "Missing infos for aircraft"}
        return "Information: Airport:\(airport), Times: \(times)"
    }
}

