//
//  AirportAnnotation.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-05-28.
//

import MapKit

class AirportAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D {
        guard let latitude = airport.location?.latitude,
              let longitude = airport.location?.longitude else {
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
    
    private let airport: Airport
    
    init(airport: Airport) {
        self.airport = airport
    }
}
