//
//  ContentView.swift
//  Map
//
//  Created by 小林陽 on 2023/04/26.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView()
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
}

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334900,
                                       longitude: 112.009020),
        latitudinalMeters: 10000,
        longitudinalMeters: 10000
    )
    
    var body: some View {
        Map(coordinateRegion: $region).ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
