//
//  AirportMapView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-05-28.
//

import MapKit

final class AirportMapView: UIView {
    
    var flight: Flight? {
        didSet {
            drawAnnotations()
        }
    }
    
    private let mapView = MKMapView()
    
    private enum Constant {
        static let airportAnnotation = "airportAnnotation"
        static let mapEdgePadding = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
    }

    init() {
        super.init(frame: .zero)
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
        addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawAnnotations() {
        guard let departureAirport = flight?.departureAirport,
              let arrivalAirport = flight?.arrivalAirport else {
            print("Can't draw annoatation, missing informations")
            return
        }
        let departureAnnotation = AirportAnnotation(airport: departureAirport)
        let arrivalAnnotation = AirportAnnotation(airport: arrivalAirport)
        mapView.addAnnotation(departureAnnotation)
        mapView.addAnnotation(arrivalAnnotation)
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
        mapView.setVisibleMapRect(mapRect, edgePadding: Constant.mapEdgePadding, animated: false)
    }
}

// MARK: - MapView Delegate

extension AirportMapView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView: MKMarkerAnnotationView?

        if let reusedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constant.airportAnnotation) as? MKMarkerAnnotationView {
            annotationView = reusedAnnotationView
        } else {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Constant.airportAnnotation)
        }
        annotationView?.glyphImage = UIImage(systemName: "airplane.circle.fill")
        annotationView?.glyphTintColor = UIColor.white
        annotationView?.markerTintColor = UIColor.systemRed
        return annotationView
    }
}
