//
//  Landmark.swift
//  NearMe_Exp
//
//  Created by Shak Feizi on 8/9/22.
//

import Foundation
import MapKit


struct Landmark {
    let placemark: MKPlacemark
    
    var id: UUID {
        UUID()
    }
    var name: String {
        self.placemark.name ?? ""
    }
    var title: String {
        self.placemark.title ?? ""
    }
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
