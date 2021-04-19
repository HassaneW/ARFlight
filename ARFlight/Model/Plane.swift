//
//  ModelPlanes.swift
//  ARFlight
//
//  Created by Wandianga hassane on 02/03/2021.
//

import Foundation


struct Plane : Decodable {
    let flightType: String 
    let id: String
    let motorType: String
    let numberOfSeats: String
    let length: Double
    let cruisingSpeed: String
    let image: String

}

extension Plane: CustomStringConvertible {
    var description: String {            
        var description = """
            - Planes:
                - flightType:\(flightType),
                - id: \(id),
                - motorType:\(motorType),
                - numberOfSeats: \(numberOfSeats),
                - length:\(length),
                - cruisingSpeed: \(cruisingSpeed),
                - image: \(image)
            """
        return description
        }
    
    }
    

