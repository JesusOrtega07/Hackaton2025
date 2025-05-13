//
//  BimboPrincipal.swift
//  Bimbo
//
//  Created by Dan Figueroa on 13/05/25.
//

import SwiftUI

struct BimboPrincipal: View {
    @State private var showMap = false

    var body: some View {
        VStack {

            Button("Ver Mapa") {
                showMap = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(50)
        }
        .fullScreenCover(isPresented: $showMap) {
            MapWithMarkersView()
        }
    }
}

#Preview {
    BimboPrincipal()
}
