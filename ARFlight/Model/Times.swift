//
//  Times.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import Foundation


struct Times: Decodable {
    let scheduled: Date?
}

extension Times: CustomStringConvertible {
    var description: String {
        guard let scheduled = scheduled else { return "Missing infos for aircraft"}
        return "Times scheduled : \(scheduled)"
    }
}

