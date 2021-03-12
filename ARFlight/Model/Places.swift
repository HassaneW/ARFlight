//
//  Places.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import Foundation


// ModelFlight OK
struct Places: Decodable {
    let terminalCode: String?
    let gateNumbers: String?
    
    enum CodingKeys: String, CodingKey {
        case gateNumbers = "gateNumber"
        case terminalCode
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        terminalCode = try container.decode(String.self, forKey: .terminalCode)
        
        let gateNumbersArray = try container.decode([String].self, forKey: .gateNumbers)
        gateNumbers = gateNumbersArray == [""] ? nil : gateNumbersArray.joined(separator: " ,")
    }
}

extension Places: CustomStringConvertible {
    var description: String {
        guard let terminalCode = terminalCode else { return "Missing infos for place"}
        let result = "Terminal: \(terminalCode)"
        guard let gateNumbers = gateNumbers  else { return result }
        return "\(result), gate numbers: \(gateNumbers)"
    }
}


/*
 Places Flights (Array) : OK
 
 struct Places: Decodable {
     let terminalCode: String?
     let gateNumber: [String]?
 }
 
 extension Places: CustomStringConvertible {
     var description: String {
         guard let terminalCode = terminalCode else { return "Missing infos for TerminalCode"}
         let result = "Terminal: \(terminalCode)"
         guard let gateNumber = gateNumber else { return result }
         return "\(result), gate numbers: \(gateNumber)"
     }
 }
 
 */
