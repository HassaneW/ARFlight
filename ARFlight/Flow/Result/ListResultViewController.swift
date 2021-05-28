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
        guard let selectedFlight = flights?[indexPath.row]  else {
            //TODO: handle error
            return 
        }
        coordinator?.showFlightDetailFor(flight: selectedFlight)
    }
}

/*
 class ViewController: UIViewController {
     
     private lazy var firstChildVC = FirstChildViewController()
     private lazy var secondChildVC = SecondChildViewController()
     
     private let scrollView: UIScrollView = {
         let scrollView = UIScrollView()
         scrollView.isPagingEnabled = true
         return scrollView
     }()

     override func viewDidLoad() {
         super.viewDidLoad()
         scrollView.contentSize = CGSize(width: view.frame.size.width*2, height: 0)
         view.addSubview(scrollView)
         
     }
     
     override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         scrollView.frame = view.bounds
         addChildVCs()
     }
     
     private func addChildVCs() {
         addChild(firstChildVC)
         addChild(secondChildVC)
         
         scrollView.addSubview(firstChildVC.view)
         scrollView.addSubview(secondChildVC.view)
         
         firstChildVC.view.frame = CGRect(x: 0,
                                          y: 0,
                                          width: scrollView.frame.size.width,
                                          height: scrollView.frame.size.height)
         
         secondChildVC.view.frame = CGRect(x: scrollView.frame.size.width,
                                           y: 0,
                                           width: scrollView.frame.size.width,
                                           height: scrollView.frame.size.height)
         
         firstChildVC.didMove(toParent: self)
         secondChildVC.didMove(toParent: self)
     }
     
     @IBAction func didChangeSegmentControlValue( _ sender: UISegmentedControl) {
         
         if sender.selectedSegmentIndex == 0 {
             // First
             scrollView.setContentOffset(.zero, animated: true)
             
         } else {
             // Second
             
             scrollView.setContentOffset(CGPoint(x: view.frame.size.width, y: 0), animated: true)
         }
         
     }


 }

 */


/*
 
 Annotations
 
 Mapkit
 import UIKit
 import MapKit
 import CoreLocation

 class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
     
     @IBOutlet weak var mapView :MKMapView!
     private let locationManager = CLLocationManager()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         self.mapView.delegate = self
         
         locationManager.delegate = self
         locationManager.requestWhenInUseAuthorization()
         
         locationManager.desiredAccuracy = kCLLocationAccuracyBest
         locationManager.distanceFilter = kCLDistanceFilterNone
         
         locationManager.startUpdatingLocation()
         
         self.mapView.showsUserLocation = true
     }
     
     @IBAction func addAnnotationButtonPressed() {
         
         let annotation = MKPointAnnotation()
         annotation.coordinate = CLLocationCoordinate2D(latitude: 37.331820, longitude: -122.031180)
         annotation.title = "Coffee Shop"
         annotation.subtitle = "Get your delicious coffee!"
         
         self.mapView.addAnnotation(annotation)
     }
     
     func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
         
         let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
         
         mapView.setRegion(region, animated: true)
     }
     

 }

 */

/*
 
 Distance
 
 import UIKit
 import MapKit
 import CoreLocation

 class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
     
     @IBOutlet weak var mapView :MKMapView!
     private let locationManager = CLLocationManager()
     
     private var directions = [String]()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         self.mapView.delegate = self
         
         locationManager.delegate = self
         locationManager.requestWhenInUseAuthorization()
         
         locationManager.desiredAccuracy = kCLLocationAccuracyBest
         locationManager.distanceFilter = kCLDistanceFilterNone
         locationManager.startUpdatingLocation()
         
         self.mapView.showsUserLocation = true
     }
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
         guard let nc = segue.destination as? UINavigationController,
               let directionsTVC = nc.viewControllers.first as? DirectionsTableViewController
         else {
             return
         }
         
         directionsTVC.directions = self.directions
         
     }
     
     @IBAction func showAddAddressView() {
         
         let alertVC = UIAlertController(title: "Add Address", message: nil, preferredStyle: .alert)
         
         alertVC.addTextField { textField in
             
         }
         
         let okAction = UIAlertAction(title: "Ok", style: .default) { action in
             
             if let textField = alertVC.textFields?.first {
                 
                 self.reverseGeocode(address: textField.text!) { placemark in
                     
                     let destinationPlacemark = MKPlacemark(coordinate: (placemark.location?.coordinate)!)
                     
                     let startingMapItem = MKMapItem.forCurrentLocation()
                     let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
                     
                     let directionsRequest = MKDirectionsRequest()
                     directionsRequest.transportType = .automobile
                     directionsRequest.source = startingMapItem
                     directionsRequest.destination = destinationMapItem
                     
                     let directions = MKDirections(request: directionsRequest)
                     directions.calculate(completionHandler: { (response, error) in
                         
                         if let error = error {
                             print(error.localizedDescription)
                             return
                         }
                         
                         guard let response = response,
                             let route = response.routes.first else {
                                 return
                         }
                         
                         if !route.steps.isEmpty {
                             
                             for step in route.steps {
                                 print(step.instructions)
                                 self.directions.append(step.instructions)
                             }
                         }
                         
                         self.mapView.add(route.polyline, level: .aboveRoads)
                         
                     })
                     
                     
                 }
                 
             }
         }
         
         let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
             
         }
         
         alertVC.addAction(okAction)
         alertVC.addAction(cancelAction)
         
         self.present(alertVC, animated: true, completion: nil)
     }
   
     func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
         
         let renderer = MKPolylineRenderer(overlay: overlay)
         renderer.lineWidth = 5.0
         renderer.strokeColor = UIColor.purple
         return renderer
         
     }
     
     private func reverseGeocode(address :String, completion :@escaping (CLPlacemark) -> ()) {
         
         let geoCoder = CLGeocoder()
         
         geoCoder.geocodeAddressString(address) { (placemarks,error) in
             
             if let error = error {
                 print(error.localizedDescription)
                 return
             }
             
             guard let placemarks = placemarks,
                 let placemark = placemarks.first else {
                     return
             }
             
             completion(placemark)
         }

     }
     
     
     func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
         
         let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
         
         mapView.setRegion(region, animated: true)
     }
     

 }


 */
