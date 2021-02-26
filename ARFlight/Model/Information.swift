//
//  Information.swift
//  ARFlight
//
//  Created by Wandianga hassane on 20/02/2021.
//

import Foundation

// TODO: times scheduled a deplacer dans information directement
struct Information: Decodable {
    let airport : Airport?
    let times: Times?
}
