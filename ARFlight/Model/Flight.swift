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
    case unknown
    
    init(from decoder: Decoder) throws {
        self = try FlightType(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}

struct Flight: Decodable {
    let flightNumber: String?
    var departureDate: Date?
    let identifiantPlane : String? // planeId
    let flightType: FlightType?
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
        
        flightType = try? container.decode(FlightType.self, forKey: .flightType)
        
        departureDate = try container.decode(Date.self, forKey: .departureDate)
        
        flightStatus = try container.decode(String.self, forKey: .flightStatus)
        
        company = try container.decode(Airline.self, forKey: .company)
        
        identifiantPlane = try container.decode(String.self, forKey: .identifiantPlane)
        
        let intFlightNumber = try container.decode(Int.self, forKey: .flightNumber)
        flightNumber = String(intFlightNumber)
        
        flightInformations = try container.decode([FlightLegs].self, forKey: .flightInformations)
    }
}

// MARK: - Helper properties
extension Flight {
    var firstFlightLeg: FlightLegs? {
        flightInformations?.first
    }
    var lastFlightLeg: FlightLegs? {
        flightInformations?.last
    }
    var durationFlight : String? {
        firstFlightLeg?.duration
    }
    var departureDateTime: Date? {
        firstFlightLeg?.departureDateTime
    }
    var departureAirport: Airport? {
        firstFlightLeg?.departure?.airport
    }
    var departureCodeAirport: String? {
        departureAirport?.code
    }
    var departureTerminalAirport: String? {
        firstFlightLeg?.departPlacesTerminal
    }
    var departureAirportName: String? {
        firstFlightLeg?.departureAirportName
    }
    var arrivalTerminalAirport: String? {
        firstFlightLeg?.arrivalPlacesTerminal
    }
    var arrivalAirport: Airport? {
        firstFlightLeg?.arrival?.airport
    }
    var arrivalCodeAirport: String? {
        arrivalAirport?.code
    }
    var arrivalDateTime: Date? {
        lastFlightLeg?.arrivalDateTime
    }
    var arrivalAirportName: String? {
        lastFlightLeg?.arrivalAirportName
    }
    var planeId: String? {
        firstFlightLeg?.aircraft?.model// construire le plane id depuis 
    }
}

// MARK: - CustomStringConvertible
extension Flight: CustomStringConvertible {
    var description: String {
        var description = """
    - Flight:
        - Number: \(flightNumber ?? "Not available")
        - Departure Date: \(departureDate ?? Date())
        - Type: \(flightType)
        - Status: \(flightStatus ?? "Missing")
        - Airline: \(company?.description ?? "Not available")
"""
        if let departureInfo = flightInformations?[0].departure {
            description.append("\n        - Departure infos: \(departureInfo)")
        }
        if let arrivalInfo = flightInformations?[0].arrival {
            description.append("\n        - Arrival infos: \(arrivalInfo)")
        }
        return description
    }
}
