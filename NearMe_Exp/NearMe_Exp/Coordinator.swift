//
//  Coordinator.swift
//  NearMe_Exp
//
//  Created by Shak Feizi on 8/9/22.
//

import UIKit
import MapKit


final class Coordinator: NSObject, MKMapViewDelegate {
    var control: MapView
    
    init(control: MapView) {
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                }
            }
        }
    }
}
