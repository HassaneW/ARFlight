//
//  Airport.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import Foundation

struct Airport: Decodable {
    let code: String?
    let name: String?
    let location: Location?
    let city: String?
    let country: String?
    let places : Places?
    
    enum AirportKeys : String, CodingKey {
        case code
        case name = "nameLangTranl"
        case location
        case places
        case city
        
        enum CityKeys : String, CodingKey {
            case cityName = "nameLangTranl"
            case country
            
            enum CountryKeys : String, CodingKey {
                case countryName = "nameLangTranl"
            }
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AirportKeys.self)
        code = try container.decode(String.self, forKey: .code)
        location = try container.decode(Location.self, forKey: .location)
        name = try container.decode(String.self, forKey: .name)
        
        let cityContainer = try container.nestedContainer(keyedBy: AirportKeys.CityKeys.self, forKey: .city)
        city = try cityContainer.decode(String.self, forKey: .cityName)
        let countryContainer = try cityContainer.nestedContainer(keyedBy: AirportKeys.CityKeys.CountryKeys.self, forKey: .country)
        country = try countryContainer.decode(String.self, forKey: .countryName)
        
        //TODO decoding places
        
        places = try container.decode(Places.self, forKey: .places)
    }
}
