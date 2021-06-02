//
//  ModelFlightTests.swift
//  ARFlightTests
//
//  Created by Wandianga hassane on 2021-06-01.
//

import XCTest
@testable import ARFlight

class ModelFlightTests: XCTestCase {
    
    private var jsonDecoder: JSONDecoder {
        enum DateError: String, Error {
            case invalidDateFormat
        }
        
        let jsonDecoder = JSONDecoder()
        let formatter = DateFormatter()
        jsonDecoder.dateDecodingStrategy = .custom({ decoder -> Date in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            
            // Date format for departure date
            formatter.dateFormat = "yyyy-MM-dd"
            if let date = formatter.date(from: dateString) {
                return date
            }
            // Date format for flight informations
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
            if let date = formatter.date(from: dateString) {
                return date
            }
            throw DateError.invalidDateFormat
        })
        return jsonDecoder
    }
    
    func test_flight() throws {
        let data = try loadData(for: "flights.json")
        let response = try jsonDecoder.decode(Flights.self, from: data)
        XCTAssertEqual(response.flights.count, 2)
        
        let flight = try XCTUnwrap(response.flights.first, "flight not found")
        
        XCTAssertEqual(flight.flightNumber, "718")
        XCTAssertEqual(flight.departureDate?.description, "2021-06-01 00:00:00 +0000")
        XCTAssertEqual(flight.identifiantPlane, "20210601+AF+0718")
        XCTAssertEqual(flight.flightType, .long)
        XCTAssertEqual(flight.flightStatus, "On time")
        
        XCTAssertEqual(flight.durationFlight, "PT5H45M")
        // A completer
        
        
        
        
        /*
         // MARK: - Helper properties
         extension Flight {
            
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
         */
        
    }
    
    
    func test_airline() throws {
        let data = try loadData(for: "flights.json")
        let response = try jsonDecoder.decode(Flights.self, from: data)
        
        let flight = try XCTUnwrap(response.flights.first, "flight not found")
        
        let company = flight.company
        XCTAssertEqual(company?.code, "AF")
        XCTAssertEqual(company?.name, "AIR FRANCE")
    }
    
    func test_flightLegs() throws {
        let data = try loadData(for: "flights.json")
        let response = try jsonDecoder.decode(Flights.self, from: data)
        
        let flight = try XCTUnwrap(response.flights.first, "flight not found")
        let flightInfo = try XCTUnwrap(flight.flightInformations?.first, "flight information not found")
        
        XCTAssertEqual(flightInfo.duration, "PT5H45M")
        
        // Depart
        XCTAssertEqual(flightInfo.departure?.airport?.code, "CDG")
        XCTAssertEqual(flightInfo.departure?.airport?.name,"Charles De Gaulle Airport")
        XCTAssertEqual(flightInfo.departure?.airport?.city,"Paris")
        XCTAssertEqual(flightInfo.departure?.airport?.country,"France")
        XCTAssertEqual(flightInfo.departure?.airport?.places?.gateNumbers,"K35")
        XCTAssertEqual(flightInfo.departure?.airport?.location?.latitude, 49.0097)
        XCTAssertEqual(flightInfo.departure?.airport?.location?.longitude, 2.5486)
        XCTAssertEqual(flightInfo.departure?.times?.scheduled?.description,"2021-06-01 14:45:00 +0000")
        
        // Arrival
        XCTAssertEqual(flightInfo.arrival?.airport?.code, "DSS")
        XCTAssertEqual(flightInfo.arrival?.airport?.name,"Blaise Diagne Intl")
        XCTAssertEqual(flightInfo.arrival?.airport?.city,"Dakar")
        XCTAssertEqual(flightInfo.arrival?.airport?.country,"Senegal")
        XCTAssertEqual(flightInfo.arrival?.airport?.location?.latitude, 14.6711)
        XCTAssertEqual(flightInfo.arrival?.airport?.location?.longitude, -17.0669)
        XCTAssertEqual(flightInfo.departure?.times?.scheduled?.description,"2021-06-01 20:30:00 +0000")
    }
    
    func test_plane() throws {
        let data = try loadData(for: "plane.json")
        let response = try jsonDecoder.decode([Plane].self, from: data)
        XCTAssertEqual(response.count, 17)
        
        let plane = try XCTUnwrap(response.first, "Plane not found")
        
        XCTAssertEqual(plane.flightType, "longHaul")
        XCTAssertEqual(plane.id, "AIRBUS A330-200")
        XCTAssertEqual(plane.motorType, "CF6-80E1A3")
        XCTAssertEqual(plane.numberOfSeats, "224")
        XCTAssertEqual(plane.length, 58.36)
        XCTAssertEqual(plane.cruisingSpeed, "M 0,82")
        XCTAssertEqual(plane.image, "a330-200")
    }
    
}

