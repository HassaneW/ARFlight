//
//  ListResultViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-03-26.
//

import Foundation
import MapKit


// A)
// Créer un MapView et un TableView dans un seul fichier avec des controller qui s'adapte (pb, UIViewController et UItableViewController)

// B)
// Créer mapview et tableview dans une stackview
//
// C) Mapkit :
// a) Créer une carte
// b) Connecté : object location et Mapkit
// c) Créer annotation dans la mapview : Location (Depart, Arrivé)
// d) le rendre dynamique

// Modele :
/*
 Depart:
 FlightLegs -> departure -> Airport Location -> latitude, longitude
 
 Arrive:
 FlightLegs -> arrival -> Airport Location -> latitude, longitude
*/

// D)
// Créer tableview
// Créer CustomCell avec les infos du voyage du modele de donnée : Code vol, Code Company, Airport Depart, Airport Arrivée, Heure Départ, Heure Arrvivé

// Modele :

/*
1)
 Code vol (Identifiant vol) :
 Flight -> flightNumber;
 
2)
 Code Company:
 Flight -> company -> code
 
3)
 Airport Depart:
 FlightLegs -> departure -> Airport Location -> latitude, longitude
 
 Airport Arrivée:
 FlightLegs -> arrival -> Airport Location -> latitude, longitude
 
4)
 Heure Départ
 Flight -> departureDate
 
 5)
 Flight -> FlightLegs -> arrival -> times -> scheduled
 
 */



class ListResultViewController: UIViewController {

    let resultTableView = UITableView()
    let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let airport = Airport(name: "Super airport", code: "CMN", latitude: 123.34, longitude: 345.3)
        let annotation = AirportAnnotation(airport: airport)
        mapView.addAnnotation(annotation)
        centerMapAroundAnnotation()
    }
    
    private func centerMapAroundAnnotation() {
        guard !mapView.annotations.isEmpty else { return }
        
        var mapRect = MKMapRect.null
        
        mapView.annotations.forEach { annotation in
            let mapPoint = MKMapPoint(annotation.coordinate)
            let annotationRect = MKMapRect(x: mapPoint.x, y: mapPoint.y, width: 0.1, height: 0.1)
            
            if mapRect.isNull {
                mapRect = annotationRect
            } else {
                mapRect = mapRect.union(annotationRect)
            }
        }
        
        mapView.setVisibleMapRect(mapRect, edgePadding: UIEdgeInsets.zero, animated: true)
    }
}

// MARK: - UI Configuration

extension ListResultViewController {
    private enum Constant {
        static let mapHeight: CGFloat = 300
        static let airportAnnotation = "airportAnnotation"
    }
    
    private func setupView() {
        
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        mapView.isPitchEnabled = false
        mapView.isRotateEnabled = false
        mapView.showsScale = false
        mapView.showsCompass = false
        mapView.showsUserLocation = false
        mapView.isAccessibilityElement = false
        mapView.pointOfInterestFilter = .excludingAll
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        
        // tableview config
        
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.heightAnchor.constraint(equalToConstant: Constant.mapHeight)
        
        
        
        ])
    }
}

extension ListResultViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView: MKAnnotationView?
        
        if let reusedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constant.airportAnnotation) {
            annotationView = reusedAnnotationView
        } else {
            // TEST
            
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: Constant.airportAnnotation)
        }
        
        return annotationView
    }
}

extension ListResultViewController: UITableViewDelegate {
    
}


//class ResultFlightsTableViewController: UITableViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
//
//}
//
//class AirportAnnotationView: MK

class AirportAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D {
        guard let latitude = airport.location?.latitude, let longitude = airport.location?.longitude else {
            return kCLLocationCoordinate2DInvalid
        }
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var title: String? {
        return airport.name
    }
    
    var subtitle: String? {
        return airport.code
    }
    
    let airport: Airport
    
    init(airport: Airport) {
        self.airport = airport
    }
}
