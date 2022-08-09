//
//  PlaceListView.swift
//  NearMe_Exp
//
//  Created by Shak Feizi on 8/9/22.
//

import SwiftUI
import MapKit


struct PlaceListView: View {
    let landmarks: [Landmark]
    var onTap: () -> ()
    
    var body: some View {
        VStack {
            HStack {
                EmptyView()
            }
            .frame(width: UIScreen.main.bounds.size.width, height: 60)
            .background(.blue)
            .gesture(TapGesture()
                .onEnded(self.onTap)
            )
            List(self.landmarks, id: \.id) { landmark in
                Text(landmark.name)
            }.animation(nil)
        }
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(landmarks: [Landmark(placemark: MKPlacemark())], onTap: {})
    }
}
