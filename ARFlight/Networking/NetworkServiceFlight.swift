//
//  NetworkServiceFlight.swift
//  ARFlight
//
//  Created by Wandianga hassane on 08/02/2021.
//

import Foundation
import UIKit

enum DateError: String, Error {
    case invalidDateFormat
}
// MARK: - NetworkServiceFlight
class NetworkServiceFlight {
    static var shared = NetworkServiceFlight()
    private init() {}
    private var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        decoder.dateDecodingStrategy = .custom({ decoder -> Date in
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
        return decoder
    }

    private var apiUrl = ConfigNetworkingService.AirFranceKlm.baseUrl
    private var task: URLSessionDataTask?
    private var flightSession = URLSession(configuration: .default)
    
    init(flightSession: URLSession, apiUrl: String) {
        self.flightSession = flightSession
        self.apiUrl = apiUrl
    }
    init(flightSession: URLSession) {
        self.flightSession = flightSession
    }
    
    // MARK: - Requests
    func searchForFlight(startRange: String, endRange: String, origin: String, destination: String, completion: @escaping (Result<[Flight], NetworkError>) -> Void) {
        
        let arguments = [
            "startRange": startRange,
            "endRange": endRange,
            "origin": origin,
            "destination": destination
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
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(ConfigNetworkingService.AirFranceKlm.apiKey, forHTTPHeaderField: "Api-Key")
        urlRequest.addValue("application/hal+json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("en-EN", forHTTPHeaderField: "Accept-Language")
        
        print("Request: \(urlRequest)")
        flightSession.dataTask(with: urlRequest) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.requestError(error.localizedDescription)))
                }
                
                guard let response = response as? HTTPURLResponse else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                let status = response.statusCode
                guard (200...299).contains(status) else {
                    guard let errorData = data,
                          let afError = try? self.jsonDecoder.decode(AFError.self, from: errorData) else {
                        completion(.failure(.errorStatusCode(status)))
                        return
                    }
                    completion(.failure(.afError(afError)))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                
                do {
                    let flights = try self.jsonDecoder.decode(Flights.self, from: data)
                    completion(.success(flights.flights))
                } catch DecodingError.keyNotFound(let key, let context) {
                    print("Failed to decode due to missing key `\(key.stringValue)` - \(context.debugDescription)")
                    completion(.failure(.decodingError))
                } catch DecodingError.typeMismatch(_, let context) {
                    print("Failed to decode due to type mismatch - \(context.debugDescription)")
                    completion(.failure(.decodingError))
                } catch DecodingError.valueNotFound(let type, let context) {
                    print("Failed to decode due to missing \(type) value - \(context.debugDescription)")
                    completion(.failure(.decodingError))
                } catch DecodingError.dataCorrupted(_) {
                    print("Failed to decode data because it appears to be invalid JSON")
                    completion(.failure(.decodingError))
                } catch {
                    print("Failed to decode \(error.localizedDescription)")
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
}
