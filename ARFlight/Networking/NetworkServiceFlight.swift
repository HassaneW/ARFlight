//
//  NetworkServiceFlight.swift
//  ARFlight
//
//  Created by Wandianga hassane on 08/02/2021.
//

import Foundation

enum DateError: String, Error {
    case invalidDateFormat
}


class NetworkServiceFlight {
    static var shared = NetworkServiceFlight()
    //    let flightParameters: FlightParameters
    let formatter = DateFormatter()
    private init() {}
    private var apiUrl = ConfigNetworkingService.AirFranceKlm.baseUrl
    private var task: URLSessionDataTask?
    private var flightSession = URLSession(configuration: .default)
    init(flightSession: URLSession, apiUrl : String) {
        self.flightSession = flightSession
        self.apiUrl = apiUrl
    }
    init(flightSession: URLSession) {
        self.flightSession = flightSession
    }
    
    func getflight(flightParameters: FlightParameters,startRange : String, endRange : String,departureCity : String,arrivalCity : String, origin: String, destination: String, pageSize: String, pageNumber: String, completion: @escaping (Result<Flight,Service>) -> Void) {
        let arguments = [
            "appId" : ConfigNetworkingService.AirFranceKlm.apiKey,
            startRange: flightParameters.startRange,
            endRange: flightParameters.endRange,
            departureCity: flightParameters.departureCity,
            arrivalCity: flightParameters.arrivalCity,
            origin: flightParameters.origin,
            destination: flightParameters.destination,
            pageSize: flightParameters.pageSize,
            pageNumber: flightParameters.pageNumber
            
        ]
        var urlComponents = URLComponents(string: apiUrl)
        var queryItems = [URLQueryItem]()
        for (key, value) in arguments {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        urlComponents?.queryItems = queryItems
        guard let url = urlComponents?.url else {
            completion(.failure(.invalidUrl))
            return
        }
        task = flightSession.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(.requestError(error.localizedDescription)))
            }
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            let status = response.statusCode
            guard (200...299).contains(status) else {
                completion(.failure(.errorStatusCode(status)))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let flight = try JSONDecoder().decode(Flight.self, from: data)
                
                let decoder = JSONDecoder()
                
                decoder.dateDecodingStrategy = .custom({ decoder -> Date in
                    
                    let container = try decoder.singleValueContainer()
                    let dateString = try container.decode(String.self)
                    
                    self.formatter.dateFormat = "yyyy-MM-dd"
                    if let date = self.formatter.date(from: dateString) {
                        return date
                    }
                    self.formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
                    if let date = self.formatter.date(from: dateString) {
                        return date
                    }
                    throw DateError.invalidDateFormat
                })
                
                print(flight)
                
                completion(.success(flight))
            } catch let error {
                print(error.localizedDescription)
                completion(.failure(.decodingError))
            }
        }
        task?.resume()
    }
}
