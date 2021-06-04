//
//  ServiceError.swift
//  ARFlight
//
//  Created by Wandianga hassane on 08/02/2021.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case errorStatusCode(Int)
    case decodingError
    case invalidData
    case requestError(String)
    case invalidUrl
    case afError(AFError)
}
extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .errorStatusCode(let statusCode):
            return "Invalid Status Code \(statusCode)"
        case .requestError(let description):
            return "Request error : \(description)"
        case .invalidData :
            return "Invalid data"
        case .decodingError:
            return "Decoding error"
        case .invalidUrl :
            return "Invalid Url"
        case .invalidResponse:
            return "Invalid Response"
        case .afError(let error):
            return "API Error \(error.error?.description ?? "Unknown")"
        }
    }
}
