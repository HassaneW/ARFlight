//
//  NetworkFlightTests.swift
//  ARFlightTests
//
//  Created by Wandianga hassane on 2021-06-01.
//

import XCTest
@testable import ARFlight

class NetworkFlightTests: XCTestCase {
    
    func test_getFlightInvalidURL() {
        let fakeError = FakeResponseData.error
        let urlSession = URLSessionFake(data: nil, response: nil, error: fakeError)
        let badUrl = "@,%"
        let flightService = NetworkServiceFlight(flightSession: urlSession, apiUrl: badUrl)
        let expectation = XCTestExpectation(description: "wait for queue")
        
        flightService.searchForFlight(startRange: "2021-01-14T10:00:00Z", endRange: "2021-01-20T23:59:00Z", origin: "DKR", destination: "PAR") {  (result) in
            switch result {
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error.localizedDescription, NetworkError.invalidUrl.errorDescription)
            case .success:
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for : [expectation], timeout: 0.1)
    }
    func test_getFlightError() {
        let fakeError = FakeResponseData.error
        let urlSession = URLSessionFake(data: nil, response: nil, error: fakeError)
        let flightService = NetworkServiceFlight(flightSession: urlSession)
        let expectation = XCTestExpectation(description: "wait for queue")
        
        flightService.searchForFlight(startRange: "2021-01-14T10:00:00Z", endRange: "2021-01-20T23:59:00Z", origin: "DKR", destination: "PAR") { (result) in
            switch result {
            case .failure(let error):
                XCTAssertNotNil(error)
            case .success:
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for : [expectation], timeout: 0.1)
    }
    func test_getFlightInvalidResponse() {
        let urlSession = URLSessionFake(data: nil, response: nil, error: nil)
        let flightService = NetworkServiceFlight(flightSession: urlSession)
        let expectation = XCTestExpectation(description: "wait for queue")
        
        flightService.searchForFlight(startRange: "2021-01-14T10:00:00Z", endRange: "2021-01-20T23:59:00Z", origin: "DKR", destination: "PAR") { (result) in
            switch result {
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error.localizedDescription, NetworkError.invalidResponse.errorDescription)
            case .success:
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for : [expectation], timeout: 0.1)
    }
    func test_getFlightErrorStatusCode() {
        let fakeResponse = FakeResponseData.responseKO
        let urlSession = URLSessionFake(data: nil, response: fakeResponse, error: nil)
        let flightService = NetworkServiceFlight(flightSession: urlSession)
        let expectation = XCTestExpectation(description: "wait for queue")
        
        flightService.searchForFlight(startRange: "2021-01-14T10:00:00Z", endRange: "2021-01-20T23:59:00Z", origin: "DKR", destination: "PAR") { (result) in
            switch result {
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error.localizedDescription, NetworkError.errorStatusCode(500).errorDescription)
            case .success:
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for : [expectation], timeout: 0.1)
    }
    func test_getFlightInvalidData() {
        let fakeResponse = FakeResponseData.responseOK
        let urlSession = URLSessionFake(data: nil, response: fakeResponse, error: nil)
        let flightService = NetworkServiceFlight(flightSession: urlSession)
        let expectation = XCTestExpectation(description: "wait for queue")
        
        flightService.searchForFlight(startRange: "2021-01-14T10:00:00Z", endRange: "2021-01-20T23:59:00Z", origin: "DKR", destination: "PAR") { (result) in
            switch result {
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error.localizedDescription, NetworkError.invalidData.errorDescription)
            case .success:
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for : [expectation], timeout: 0.1)
    }
    func test_getFlightDecodingError() {
        let fakeData = FakeResponseData.incorrectData
        let fakeResponse = FakeResponseData.responseOK
        let urlSession = URLSessionFake(data: fakeData, response: fakeResponse, error: nil)
        let flightService = NetworkServiceFlight(flightSession: urlSession)
        let expectation = XCTestExpectation(description: "wait for queue")
        
        flightService.searchForFlight(startRange: "2021-01-14T10:00:00Z", endRange: "2021-01-20T23:59:00Z", origin: "DKR", destination: "PAR") { (result) in
            switch result {
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error.localizedDescription, NetworkError.decodingError.errorDescription)
            case .success:
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for : [expectation], timeout: 0.1)
    }
    
    func test_getFlightDecodingSucess() {
        let fakeData = FakeResponseData.flightsCorrectData
        let fakeResponse = FakeResponseData.responseOK
        let urlSession = URLSessionFake(data: fakeData, response: fakeResponse, error: nil)
        let flightService = NetworkServiceFlight(flightSession: urlSession)
        let expectation = XCTestExpectation(description: "wait for queue")
        
        flightService.searchForFlight(
            startRange: "2021-06-01T11:21:44Z",
            endRange: "2021-06-02T11:21:00Z",
            origin: "CDG",
            destination: "DSS") { (result) in
            
            switch result {
            case .success (let flights):
                XCTAssertEqual(flights.count, 2)
                
            case .failure:
                XCTFail("Request should be a success")
            }
            
            //        case .success (let money):
            //            XCTAssertEqual(money.base, "EUR")
            //            XCTAssertEqual(money.date, "2020-08-25")
            //            XCTAssertEqual(money.monnaie.dollar, 1.183019)
            //            XCTAssertEqual(money.monnaie.cfa, 657.685376)
            //            XCTAssertEqual(money.baseConversion, 1.183019)
            //            XCTAssertEqual(money.description, "Base Money : EUR, date : 2020-08-25, Conversion : 1.183019$")
            
            expectation.fulfill()
        }
        wait(for : [expectation], timeout: 0.5)
    }
}
