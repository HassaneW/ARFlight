//
//  Flight.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import Foundation





enum FlightType: String, Decodable {
    case medium = "MEDIUM"
    case long = "LONG"
}

struct Flight: Decodable {
    let flightNumber: String?
    var departureDate: Date?
    let identifiantPlane : String?
    let flightType: FlightType
    let company : Airline?
    let flightStatus : String?
    let flightInformations : [FlightLegs]?
    
    private enum CodingKeys : String, CodingKey {
        
        case departureDate = "flightScheduleDate"
        case flightType = "haul"
        case company = "airline"
        case flightStatus = "flightStatusPublicLangTransl"
        case flightInformations = "flightLegs"
        case identifiantPlane = "id"
        case flightNumber
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        flightType = try container.decode(FlightType.self, forKey: .flightType)
        
        departureDate = try container.decode(Date.self, forKey: .departureDate)
        
        flightStatus = try container.decode(String.self, forKey: .flightStatus)
        
        company = try container.decode(Airline.self, forKey: .company)
        
        identifiantPlane = try container.decode(String.self, forKey: .identifiantPlane)
        
        let intFlightNumber = try container.decode(Int.self, forKey: .flightNumber)
        flightNumber = String(intFlightNumber)
        
        flightInformations = try container.decode([FlightLegs].self, forKey: .flightInformations)
    }
    
    func formatDepartureDate(decoder : JSONDecoder, formatter: DateFormatter) {
        //        let decoder = JSONDecoder()
        //        let formatter = DateFormatter()
        
        decoder.dateDecodingStrategy = .custom({ decoder -> Date in
            
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            
            
            formatter.dateFormat = "yyyy-MM-dd"
            if let date = formatter.date(from: dateString) {
                return date
            }
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
            if let date = formatter.date(from: dateString) {
                return date
            }
            throw DateError.invalidDateFormat
        })
        
    }
}

//enum DateError: String, Error {
//    case invalidDateFormat
//}


extension Flight : CustomStringConvertible {
    
    var description: String {
        return """
Info Vol
 Flight number : \(flightNumber),
 Departure Date : \(departureDate),
 identifiant vol : \(identifiantPlane),
 Flight statut : \(flightStatus),
 Company code : \(company?.code),
 Company name : \(company?.name),
 Flight type : \(flightType),

Info Depart
departure time: \(flightInformations?[0].departure?.times),
Code airport :
\(flightInformations?[0].departure?.airport?.code),
Name Airport :
\(flightInformations?[0].departure?.airport?.name),
City Airport :
\(flightInformations?[0].departure?.airport?.city),
Country Airport :
\(flightInformations?[0].departure?.airport?.country),
Coordonnées Airport :
    Latitude :
\(flightInformations?[0].departure?.airport?.location?.latitude),
        Longitude:
\(flightInformations?[0].departure?.airport?.location?.longitude),
Places :
        GateNumber :
\(flightInformations?[0].departure?.airport?.places?.gateNumber),
        Terminal :
\(flightInformations?[0].departure?.airport?.places?.terminal)/n,

Info Arrivée :

Arrival time: \(flightInformations?[0].arrival?.times),
Code airport :
\(flightInformations?[0].arrival?.airport?.code),
Name Airport :
\(flightInformations?[0].arrival?.airport?.name),
City Airport :
\(flightInformations?[0].arrival?.airport?.city),
Country Airport :
\(flightInformations?[0].arrival?.airport?.country),
Coordonnées Airport :
    Latitude :
\(flightInformations?[0].arrival?.airport?.location?.latitude),
        Longitude:
\(flightInformations?[0].arrival?.airport?.location?.longitude),
Places :
        GateNumber :
\(flightInformations?[0].arrival?.airport?.places?.gateNumber),
        Terminal :
\(flightInformations?[0].arrival?.airport?.places?.terminal)/n,

Info Avion

Model Avion :
\(flightInformations?[0].aircraft?.model)

Number Model Avion :
\(flightInformations?[0].aircraft?.number)

"""
    }
}

// MARK: - Decode FlightEntity Model

extension Flight {
    
    init(from flightEntity: FlightEntity) {
        flightNumber = flightEntity.flightNumber ?? ""
//        imageUrl = flightEntity.imageUrl ?? ""
//        url = flightEntity.url ?? ""
//        portions = flightEntity.portions
//        totalTime = flightEntity.totalTime
        
//        if let ingredientsData = recipeEntity.ingredients,
//            let unwrappedIngredients = try? JSONDecoder().decode([String].self, from: ingredientsData) {
//            ingredients = unwrappedIngredients
//        } else {
//            ingredients = []
//        }
    }
}

// MARK: - Reciplease

struct Flights: Decodable {

    let flight: [Flight]

//    enum CodingKeys: String, CodingKey {
//        case recipes = "hits"
//    }
}







