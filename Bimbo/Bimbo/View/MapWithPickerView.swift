//
//  MapWithPickerView.swift
//  Bimbo
//
//  Created by Dan Figueroa on 13/05/25.
//
import SwiftUI
import MapKit

struct MapWithMarkersView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 23.6345, longitude: -102.5528),
            span: MKCoordinateSpan(latitudeDelta: 40.0, longitudeDelta: 40.0)
        )
    )

    @State private var selectedCountry: String? = "México"
    @State private var showSheet = true
    @State private var selectedInfo: InfoRegiones? = infoRegiones.first { $0.region == .mexico }

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
        ZStack {
            Map(position: $position) {
                ForEach(countries.sorted(by: { $0.key < $1.key }), id: \.key) { name, coord in
                    Annotation(name, coordinate: coord) {
                        Button(action: {
                            showSheet = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if let regionEnum = RegionesEnum(rawValue: name),
                                   let info = infoRegiones.first(where: { $0.region == regionEnum }) {
                                    selectedCountry = name
                                    selectedInfo = info
                                    showSheet = true
                                }
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

            // Botón flotante superpuesto con position
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.black.opacity(0.7))
                    .clipShape(Circle())
                    .shadow(radius: 4)
            }
            .position(x: 40, y: 30) // ← Ajusta según tu diseño y notch
        }
        .sheet(isPresented: $showSheet, onDismiss: {
            selectedCountry = nil
            selectedInfo = nil
        }) {
            if let info = selectedInfo {
                CountryInfoSheet(info: info)
                    .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    MapWithMarkersView()
}
