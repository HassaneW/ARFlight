//
//  ModelPlanes.swift
//  ARFlight
//
//  Created by Wandianga hassane on 02/03/2021.
//

import Foundation


struct Plane : Decodable {
    let flightType: String? // possible de remove
    let id: String?
    let motorType: String?
    let numberOfSeats: String?
    let length: Double?
    let cruisingSpeed: String?
    let image: String?
}

extension Plane: CustomStringConvertible {
    var description: String {
        guard let flightType = flightType, let id = id, let motorType = motorType, let numberOfSeats = numberOfSeats, let length = length, let cruisingSpeed = cruisingSpeed, let image = image   else { return "Missing infos for plane"}
        return """
            - Planes:
                - flightType:\(flightType),
                - id: \(id),
                - motorType:\(motorType),
                - numberOfSeats: \(numberOfSeats),
                - length:\(length),
                - cruisingSpeed: \(cruisingSpeed),
                - image: \(image)
            """
    }
}
