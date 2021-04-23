//
//  MainCoordinator.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-06.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showSearchFlightController()
        
//        showListResultController(with: <#T##[Flight]#>)
    }

    func showSearchFlightController() {
        let searchFlightViewController = SearchFlightViewController()
        searchFlightViewController.coordinator = self
        navigationController.pushViewController(searchFlightViewController, animated: false)
    }

    func showListResultController(with flights:[Flight]) {
        let listResultViewController = ListResultViewController()
        listResultViewController.coordinator = self
        listResultViewController.flights = flights
        navigationController.pushViewController(listResultViewController, animated: true)
    }

    // flightId
    func showFlightDetailsFor(flightId: String?) {
        // Pour plus tard
    }
    func showFlightDetailFor(flight: Flight?) {
        let flightDetailViewController = DetailsFlightViewController(flight: flight)
        flightDetailViewController.coordinator = self
        //flightDetailViewController.flight = flight
        navigationController.pushViewController(flightDetailViewController, animated: true)
    }
    
}
