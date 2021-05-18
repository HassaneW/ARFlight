//
//  AFError.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-05-18.
//

import Foundation

public struct AFError: Decodable {
    
    struct Error: Decodable {
        let code: String?
        let name: String?
        let description: String?
        let severity: String?
    }
    
    let errors: [Error]
    
    var error: Error? {
        return errors.first
    }
}
