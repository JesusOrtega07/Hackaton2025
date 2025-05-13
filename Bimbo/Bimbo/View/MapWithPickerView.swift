//
//  MapWithPickerView.swift
//  Bimbo
//
//  Created by Dan Figueroa on 13/05/25.
//

import SwiftUI
import MapKit

struct MapWithMarkersView: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 23.6345, longitude: -102.5528),
            span: MKCoordinateSpan(latitudeDelta: 40.0, longitudeDelta: 40.0)
        )
    )
    
    @State private var selectedCountry: String? = "México"
    @State private var showSheet = true
    
    let countries = [
        "México": CLLocationCoordinate2D(latitude: 23.6345, longitude: -100.5528),
        "Estados Unidos - Canada": CLLocationCoordinate2D(latitude: 50.0902, longitude: -107.7129),
        "Centro America": CLLocationCoordinate2D(latitude: -1.4161, longitude: -71.6167),
        "Brasil": CLLocationCoordinate2D(latitude: -11.4161, longitude: -48.6167),
        "Europa": CLLocationCoordinate2D(latitude: 49.0902, longitude: 12.7129),
        "Africa": CLLocationCoordinate2D(latitude: 16.0902, longitude: 15.7129),
        "Asia": CLLocationCoordinate2D(latitude: 36.0902, longitude: 103.7129)
    ]
    
    var body: some View {
        Map(position: $position) {
            ForEach(countries.sorted(by: { $0.key < $1.key }), id: \.key) { name, coord in
                Annotation(name, coordinate: coord) {
                    Button(action: {
                        // Solución al problema del primer click: reinicia el estado antes de cambiarlo
                        showSheet = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            selectedCountry = name
                            showSheet = true
                        }
                    }) {
                        VStack {
                            Image("location")
                                .resizable()
                                .frame(width: 60, height: 50)
                            
                            Text(name)
                                .font(.caption)
                                .padding(4)
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(5)
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showSheet) {
            if let selected = selectedCountry {
                CountryInfoSheet(country: selected)
                    .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    MapWithMarkersView()
}
