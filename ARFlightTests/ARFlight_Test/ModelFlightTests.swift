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
        
    }
    
    func test_airline() throws {
        let data = try loadData(for: "flights.json")
        let response = try jsonDecoder.decode(Flights.self, from: data)
        
        let flight = try XCTUnwrap(response.flights.first, "flight not found")
        
        let company = flight.company
        XCTAssertEqual(company?.code, "")
        XCTAssertEqual(company?.name, "")
    }

    func test_flightLegs() throws {
        let data = try loadData(for: "flights.json")
        let response = try jsonDecoder.decode(Flights.self, from: data)
        
        let flight = try XCTUnwrap(response.flights.first, "flight not found")
        let flightInfo = try XCTUnwrap(flight.flightInformations?.first, "flight information not found")
        
        XCTAssertEqual(flightInfo.duration, "")
    }
    
    func test_plane() throws {
        
    }
    
}

