//
//  Aircraft.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import Foundation


struct Aircraft: Decodable {
    let number: String?
    let model: String?
    
    private enum CodingKeys: String, CodingKey {
        case number = "typeCode"
        case model = "typeName"
    }
}

extension Aircraft: CustomStringConvertible {
    var description: String {
        guard let number = number, let model = model else { return "Missing infos for aircraft"}
        return "Aircraft number \(number), model: \(model)"
    }
}
