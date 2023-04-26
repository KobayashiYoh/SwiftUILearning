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

let defaultMeters: Double = 16000
struct ContentView: View {
    // 初期座標はTokyo
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.68385063,
                                       longitude: 139.75397279),
        latitudinalMeters: defaultMeters,
        longitudinalMeters: defaultMeters
    )
    
    func updateRegion() {
        let latitude: Double = Double.random(in: 24...43)
        let longitude: Double = Double.random(in: 122...141)
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude,
                                           longitude: longitude),
            latitudinalMeters: defaultMeters,
            longitudinalMeters: defaultMeters
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
