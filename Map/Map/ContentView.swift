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
        latitudinalMeters: 16000,
        longitudinalMeters: 16000
    )
    
    func updateRegion() {
        let latitude: Double = Double.random(in: 24...43)
        let longitude: Double = Double.random(in: 122...141)
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude,
                                           longitude: longitude),
            latitudinalMeters: 80000,
            longitudinalMeters: 80000
        )
    }
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region).ignoresSafeArea()
            Button(action: {
                updateRegion()
            }){
                Text("座標ガチャを回す")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
