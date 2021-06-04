//
//  ListResultViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-03-26.
//

import UIKit

class ListResultViewController: UIViewController {
    
    // MARK: - Property
    weak var coordinator: MainCoordinator?
    var flights: [Flight]?
    
    private let tableView = UITableView()
    private let mapView = AirportMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.reloadData()
        
        mapView.flight = flights?.first
    }
}

// MARK: - UI Configuration
extension ListResultViewController {
    private enum Constant {
        static let mapHeight: CGFloat = 300
        static let flightCellId = "flightCellId"
    }
    
    // MARK: - mapView
    private func setupView() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(FlightResultTableViewCell.self, forCellReuseIdentifier: Constant.flightCellId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.heightAnchor.constraint(equalToConstant: Constant.mapHeight),
        
            tableView.topAnchor.constraint(equalTo: mapView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - TableView Data source
extension ListResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flights?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.flightCellId, for: indexPath) as? FlightResultTableViewCell else {
            assertionFailure("The dequeue table view cell was of an unknown type!")
            return UITableViewCell()
        }
        cell.flight = flights?[indexPath.row]
        return cell
    }
}

extension ListResultViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let selectedFlight = flights?[indexPath.row]  else {
            //TODO: handle error
            return 
        }
        coordinator?.showFlightDetailFor(flight: selectedFlight)
    }
}
