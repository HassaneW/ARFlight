//
//  MapFlightViewController.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-05-20.
//

import UIKit
import MapKit
import CoreLocation


class MapFlightViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
//
//    let mapView = MKMapView()
//    static let mapHeight: CGFloat = 300
//
//    mapView.addAnnotation(annotation)
//    centerMapAroundAnnotation()
//
//    private func centerMapAroundAnnotation() {
//        guard !mapView.annotations.isEmpty else { return }
//        var mapRect = MKMapRect.null
//        mapView.annotations.forEach { annotation in
//            let mapPoint = MKMapPoint(annotation.coordinate)
//            let annotationRect = MKMapRect(x: mapPoint.x, y: mapPoint.y, width: 0.1, height: 0.1)
//            if mapRect.isNull {
//                mapRect = annotationRect
//            } else {
//                mapRect = mapRect.union(annotationRect)
//            }
//        }
//        mapView.setVisibleMapRect(mapRect, edgePadding: UIEdgeInsets.zero, animated: true)
//    }
//
//    mapView.delegate = self
//    mapView.mapType = .standard
//    mapView.isZoomEnabled = false
//    mapView.isScrollEnabled = false
//    mapView.isPitchEnabled = false
//    mapView.isRotateEnabled = false
//    mapView.showsScale = false
//    mapView.showsCompass = false
//    mapView.showsUserLocation = false
//    mapView.isAccessibilityElement = false
//    mapView.pointOfInterestFilter = .excludingAll
//    mapView.translatesAutoresizingMaskIntoConstraints = false
//    view.addSubview(mapView)
//
//    ([
//        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//        mapView.heightAnchor.constraint(equalToConstant: Constant.mapHeight),
//
//    ])
}

//extension MapFlightViewController: MKMapViewDelegate {
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        var annotationView: MKAnnotationView?
//
//        if let reusedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constant.airportAnnotation) {
//            annotationView = reusedAnnotationView
//        } else {
//            // TEST
//
//            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: Constant.airportAnnotation)
//        }
//
//        return annotationView
//    }
//}
//
//// MARK: - AirportAnnotation
//class AirportAnnotation: NSObject, MKAnnotation {
//
//    var coordinate: CLLocationCoordinate2D {
//        guard let latitude = airport.location?.latitude, let longitude = airport.location?.longitude else {
//            return kCLLocationCoordinate2DInvalid
//        }
//        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//    }
//
//    var title: String? {
//        return airport.name
//    }
//
//    var subtitle: String? {
//        return airport.code
//    }
//
//    let airport: Airport
//
//    init(airport: Airport) {
//        self.airport = airport
//    }
//}
