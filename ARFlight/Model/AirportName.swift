//
//  CodeAirport.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-03-17.
//

import Foundation
import UIKit

/*

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
 */

// GOOD CODE Change


 struct AirportObject {
     let name: String
     let code: String
 }

extension AirportObject: CustomStringConvertible {
    var description: String {

        let description = """
            - Code: \(code)
            - Name:\(name)\n
"""
        return description
    }
}

 struct AirportName: Decodable {
//     var airportArray: [AirportObject]
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

//extension AirportName: CustomStringConvertible {
//    var description: String {
//
//        let description = """
//
//    - airportsCityCode:\n \(airportsCityCode)\n
//"""
//        return description
//    }
//}

private struct Countries: Decodable {
    let cities: [Cities]
}

//extension Countries: CustomStringConvertible {
//    var description: String {
//
//        let description = """
//    - Cities:\n \(cities)
//"""
//        return description
//    }
//}

private struct Cities: Decodable {
    let label: String
    let stopovers: [Stopovers]
}

//extension Cities: CustomStringConvertible {
//    var description: String {
//
//        let description = """
//            - Stopovers:\n\(stopovers)
//"""
//        return description
//    }
//}

private struct Stopovers: Decodable {
    let code: String
}

//extension Stopovers: CustomStringConvertible {
//    var description: String {
//
//        let description = """
//                - Code:\(code)
//"""
//        return description
//    }
//}




//
//
// let decoder = JSONDecoder()
//
// do {
//     let airportDecode = try decoder.decode(Airport.self, from: jsonData!)
//     print(airportDecode)
//
//     let paris = airportDecode.airportArray.first { $0.name == "Paris" }
//     print(paris?.code ?? "introuvable")
//
//     let departureCity = "paris"
//     let bordCode = airportDecode.airportsCityCode[departureCity]
//     print(bordCode ?? "introuvable")
// } catch let error as DecodingError {
//     print(error.prettyDescription)
// } catch {
//     print(error)
// }
//
// */
