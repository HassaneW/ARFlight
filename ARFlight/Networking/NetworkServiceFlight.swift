//
//  NetworkServiceFlight.swift
//  ARFlight
//
//  Created by Wandianga hassane on 08/02/2021.
//

import Foundation


class NetworkServiceFlight {
    static var shared = NetworkServiceFlight()
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
    
    struct FlightParameters {
        let startRange: String
        let endRange: String
        let departureCity: String
        let arrivalCity: String
        let origin: String
        let destination: String
        let pageSize: String
        let pageNumber: String
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
