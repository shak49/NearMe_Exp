//
//  ContentView.swift
//  NearMe_Exp
//
//  Created by Shak Feizi on 8/9/22.
//

import SwiftUI
import UIKit
import MapKit

struct ContentView: View {
    private var manager = LocationManager()
    
    @State private var landmarks = [Landmark]()
    @State private var searchTerm: String = ""
    @State private var tapped: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            MapView(landmarks: self.landmarks)
            TextField("Search...", text: self.$searchTerm, onEditingChanged: { _ in }) {
                getNearByLandmarks()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .offset(y: 44)
            .padding()
            PlaceListView(landmarks: self.landmarks) {
                self.tapped.toggle()
            }
            .animation(.spring())
            .offset(y: calculateOffset())
        }
        .ignoresSafeArea()
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
    
    func calculateOffset() -> CGFloat {
        if self.landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
        } else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
