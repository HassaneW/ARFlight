//
//  Places.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import Foundation


struct Places: Decodable {
    let gateNumber: String?
    let terminal : String?
    
    private enum CodingKeys : String, CodingKey {
        case gateNumber
        case terminal = "boardingTerminal"
    }
    // Decoding gate number array in string
//    init(from decoder: Decoder) throws {
//        // decoding
//        // decoder un tablea
//        let gateNumberArray = [String]() 
//        gateNumber = gateNumberArray.joined(separator: ", ")
//    }
    
//    func formatGateNumber(gateNumber: [String]?) -> String? {
//
//        return gateNumber?
//
//    }
    
}
