//
//  CodeAirport.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-03-17.
//

import Foundation

struct CodeAirport: Decodable {
    let market : String
    let countries : [Countries]
    
    private enum CodingKeys : String, CodingKey {
        case market
        case countries
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        market = try container.decode(String.self, forKey: .market)
        
        countries = try container.decode([Countries].self, forKey: .countries)
    }
}

extension CodeAirport: CustomStringConvertible {
    var description: String {

        let description = """
            \n
- Market: \(market)
- Countries: \(countries)\n
"""
        return description
    }
}

struct Countries: Decodable {
    let code : String
    let label: String
    let maximumNumberOfSeats: Int
    let minimumNumberOfAdults: Int
    let origins : [String]
    let destinations : [String]
    let passengerTypes : [PassengerTypes]
    let areas : [Areas]
    let defaultAirport: String
    let commercialCabins : [CommercialCabins]
}


extension Countries: CustomStringConvertible {
    var description: String {

        let description = """
            \n
            - Code: \(code)\n
            - Label: \(label)\n
            - MaximumNumberOfSeats: \(maximumNumberOfSeats)\n
            - MinimumNumberOfAdults: \(minimumNumberOfAdults)\n
            - Origins: \(origins)\n
            - Destinations: \(destinations)\n
            - PassengerTypes: \(passengerTypes)\n
            - Areas: \(areas)\n
            - DefaultAirport: \(defaultAirport)\n
            - CommercialCabins: \(commercialCabins)\n
"""
        return description
    }
}

struct CommercialCabins: Decodable {
    let code : String
    let label : String
}

extension CommercialCabins: CustomStringConvertible {
    var description: String {

        let description = """
            \n
                - Code: \(code)
                - Label: \(label)
"""
        return description
    }
}

struct Areas: Decodable {
    let code : String
    let countries : [CountriesAreas]
}

extension Areas: CustomStringConvertible {
    var description: String {

        let description = """
            \n
            - Code: \(code)
            - Countries: \(countries)
"""
        return description
    }
}

struct CountriesAreas: Decodable {
    let code: String
    let label : String
    let cities : [Cities]
}

extension CountriesAreas: CustomStringConvertible {
    var description: String {

        let description = """
            \n
            - Code: \(code)
            - Label: \(label)
            - Cities: \(cities)\n
"""
        return description
    }
}

struct Cities: Decodable {
    let code :String
    let label : String
    let stopovers : [Stopovers]
}

extension Cities: CustomStringConvertible {
    var description: String {

        let description = """
                \n
                - Code: \(code)
                - Label: \(label)
                - Stopovers: \(stopovers)
"""
        return description
    }
}

struct Stopovers: Decodable {
    let code: String
    let label: String
    let type: String
}

extension Stopovers: CustomStringConvertible {
    var description: String {

        let description = """
                \n
                    - Code: \(code)
                    - Label: \(label)
                    - Type: \(type)"\n
"""
        return description
    }
}

struct PassengerTypes: Decodable {
    let code: String
    let label: String
    let minAge: Int
    let displayOrder: Int
    let adult: Bool
}

extension PassengerTypes: CustomStringConvertible {
    var description: String {

        let description = """
            \n
                - Code: \(code)
                - Label: \(label)
                - minAge: \(minAge)
                - displayOrder: \(displayOrder)
                - adult: \(adult)
"""
        return description
    }
}
