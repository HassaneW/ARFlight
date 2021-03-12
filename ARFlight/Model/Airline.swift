//
//  Airline.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import Foundation


struct Airline: Decodable {
    let code: String?
    let name: String?
}

extension Airline: CustomStringConvertible {
    var description: String {
        guard let code = code, let name = name else { return "Missing infos for airline"}
        return "Airline: code:\(code), name: \(name)"
    }
}

