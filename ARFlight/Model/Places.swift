//
//  Places.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import Foundation


struct Places: Decodable {
    let gateNumber: [String]?
    let terminal : String?
    
    private enum CodingKeys : String, CodingKey {
        case gateNumber
        case terminal = "boardingTerminal"
    }
    
    func formatGateNumber(gateNumber: [String]?) -> String? {
        
        return gateNumber?.joined(separator: ", ")
        
    }
    
}
