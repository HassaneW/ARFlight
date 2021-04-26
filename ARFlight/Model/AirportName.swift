//
//  CodeAirport.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-03-17.
//

import Foundation


struct AirportName : Decodable {
    let market: String
    let countries: [Countries]
}
extension AirportName: CustomStringConvertible {
    var description: String {

        let description = """
    - Market: \(market)
    - countries:\n \(countries)
"""
        return description
    }
}

struct Countries: Decodable {
    var code: String
    var name: String
    let cities: [Cities]
    
    enum CodingKeys : String, CodingKey {
        case code
        case cities
        case name = "label"
        
        enum CitiesKeys : String, CodingKey {
            case code
            case name = "label"
            case stopovers
            
            enum StopoversKeys : String, CodingKey {
                case code
                case type
                case name = "label"
            }
        }

    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        code = try container.decode(String.self, forKey: .code)
        name = try container.decode(String.self, forKey: .name)
        cities = try container.decode([Cities].self, forKey: .cities)
    }
}
extension Countries: CustomStringConvertible {
    var description: String {

        let description = """
    - Code: \(code)
    - Name: \(name)
    - Cities:\n \(cities)
"""
        return description
    }
}
struct Cities: Decodable {
    let code: String
    let name: String
    let stopovers: [Stopovers]
    
    private enum CodingKeys : String, CodingKey {
        case code
        case stopovers
        case name = "label"

    }
}

struct Stopovers: Decodable {
    let code: String
    let name: String
    let type: String
    
    private enum CodingKeys : String, CodingKey {
        case code
        case type
        case name = "label"
    }
}
extension Cities: CustomStringConvertible {
    var description: String {

        let description = """
            - Code: \(code)
            - Name:\(name)\n
            - Stopovers:\n\(stopovers)
"""
        return description
    }
}
extension Stopovers: CustomStringConvertible {
    var description: String {

        let description = """
                - Code:\(code)
                - Name:\(name)\n
"""
        return description
    }
}
