//
//  LandmarkAnnotation.swift
//  NearMe_Exp
//
//  Created by Shak Feizi on 8/9/22.
//

import Foundation
import MapKit


final class LandmarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(landmark: Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
