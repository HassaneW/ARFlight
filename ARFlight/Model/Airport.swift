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
        name = try container.decode(String.self, forKey: .name)
        location = try container.decode(Location.self, forKey: .location)
        places = try container.decode(Places.self, forKey: .places)
        
        let cityContainer = try container.nestedContainer(keyedBy: AirportKeys.CityKeys.self, forKey: .city)
        city = try cityContainer.decode(String.self, forKey: .cityName)
        
        let countryContainer = try cityContainer.nestedContainer(keyedBy: AirportKeys.CityKeys.CountryKeys.self, forKey: .country)
        country = try countryContainer.decode(String.self, forKey: .countryName)
        
    }
}

extension Airport: CustomStringConvertible {
    var description: String {
        guard let code = code, let name = name, let city = city, let location = location, let country = country, let places = places else { return "Missing infos for aircraft"}
        return "Airport : code \(code), name: \(name),  location : \(location) city \(city), country: \(country), places : \(places) "
    }
}
