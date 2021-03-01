//
//  Places.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import Foundation


struct Places: Decodable {
    var gateNumber: String?
    let terminal : String?
    
    private enum CodingKeys : String, CodingKey {
        case gateNumber
        case terminal = "boardingTerminal"
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Recupérer un Tableau de String et le transformer en String
        
        let gateNumberStr = try container.decode([String].self, forKey: .gateNumber)
        // Recuperer un String et
        
        gateNumber = gateNumberStr.joined(separator: ",")
        
        gateNumber = try container.decode(String.self, forKey: .gateNumber)
        
        terminal = try container.decode(String.self, forKey: .terminal)
        
    }
    
}
