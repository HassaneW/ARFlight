//
//  Coordinator.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-06.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set}
    var navigationController: UINavigationController { get set }
    
    func start()
}
