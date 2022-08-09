//
//  ContentView.swift
//  NearMe_Exp
//
//  Created by Shak Feizi on 8/9/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject private var manager = LocationManager()
    @State private var landmarks = [Landmark]()
    @State private var searchTerm: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            MapView(landmarks: self.landmarks)
            TextField("Search...", text: self.$searchTerm, onEditingChanged: { _ in }) {
                getNearByLandmarks()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .offset(y: 44)
            .padding()
        }
    }
    
    private func getNearByLandmarks() {
        guard let location = self.manager.location else { return }
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchTerm
        request.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response, error == nil else { return }
            let mapItems = response.mapItems
            mapItems.map {
                print($0.placemark)
                Landmark(placemark: $0.placemark)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
