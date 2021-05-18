//
//  CodeAirport.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-03-17.
//

import Foundation
import UIKit


struct AirportName: Decodable {
    var cityCode: [String: String]
    
    enum CodingKeys: String, CodingKey {
        case countries
    }
    private struct Countries: Decodable {
        let cities: [Cities]
    }
    private struct Cities: Decodable {
        let label: String
        let stopovers: [Stopovers]
    }
    private struct Stopovers: Decodable {
        let code: String
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let countries = try container.decode([Countries].self, forKey: .countries)
        
        cityCode = [:]
        
        for country in countries {
            let cities = country.cities
            for city in cities {
                if let firstStopoverCode = city.stopovers.first?.code {
                    let cityName = city.label.lowercased()
                    cityCode[cityName] = firstStopoverCode
                }
            }
        }
    }
}
