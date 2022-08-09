//
//  MapView.swift
//  NearMe_Exp
//
//  Created by Shak Feizi on 8/9/22.
//

import UIKit
import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        Coordinator(control: self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
}


