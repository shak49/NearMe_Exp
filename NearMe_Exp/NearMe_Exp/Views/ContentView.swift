//
//  ContentView.swift
//  NearMe_Exp
//
//  Created by Shak Feizi on 8/9/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var manager = LocationManager()
    var body: some View {
        MapView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
