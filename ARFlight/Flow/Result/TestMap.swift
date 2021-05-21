//
//  TestMap.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-05-20.
//


// Carte : Localisation, Authorisation, Zooming, Switch Map
/*
import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView :MKMapView!
    @IBOutlet weak var mapTypeSegmentedControl :UISegmentedControl!
    
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
        
        self.mapTypeSegmentedControl.addTarget(self, action: #selector(mapTypeChanged), for: .valueChanged)
    }
    
    @objc func mapTypeChanged(segmentedControl :UISegmentedControl) {
        
        switch(segmentedControl.selectedSegmentIndex) {
            
            case 0:
                self.mapView.mapType = .standard
            case 1:
                self.mapView.mapType = .satellite
            case 2:
                self.mapView.mapType = .hybrid
            default:
                self.mapView.mapType = .standard
            
        }
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
        
        mapView.setRegion(region, animated: true)
    }
    
}
*/


// Annotation Custom

// 1) Controller

/*
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
         
         let annotation = CoffeeAnnotation()
         annotation.coordinate = CLLocationCoordinate2D(latitude: 37.331820, longitude: -122.031180)
         annotation.title = "Coffee Shop"
         annotation.subtitle = "Get your delicious coffee!"
         annotation.imageURL = "coffee-pin.png"
         
         self.mapView.addAnnotation(annotation)
     }
     
     func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
         
         if annotation is MKUserLocation {
             return nil
         }
         
         var coffeeAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "CoffeeAnnotationView")
         
         if coffeeAnnotationView == nil {
             
             coffeeAnnotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "CoffeeAnnotationView")
             coffeeAnnotationView?.canShowCallout = true
         } else {
             coffeeAnnotationView?.annotation = annotation
         }
         
         if let coffeeAnnotation = annotation as? CoffeeAnnotation {
             coffeeAnnotationView?.image = UIImage(named: coffeeAnnotation.imageURL)
         }
         
         return coffeeAnnotationView
         
     }
     
     func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
         
         let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
         
         mapView.setRegion(region, animated: true)
     }
     
 }

 
2) CoffeeAnnotation
 
 import Foundation
 import MapKit

 class CoffeeAnnotation :MKPointAnnotation {
     
     var imageURL :String!
 }

 3) Image
 
 coffee-pin

 */
