//
//  CountryInfoSheet.swift
//  Bimbo
//
//  Created by Dan Figueroa on 13/05/25.
//

import SwiftUI

struct CountryInfoSheet: View {
    let info: InfoRegiones

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("🌍 Información de \(info.region.rawValue)")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)

                Divider()

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 50) {
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("🧃 Su portafolio está constituido por el:")
                            .font(.subheadline)
                            .bold()
                        Text(info.portafolio)
                            .font(.caption)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text("🤝 Ha ayudado en recursos a más de:")
                            .font(.subheadline)
                            .bold()
                        Text(info.buenvecino)
                            .font(.caption)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text("⚡ El porcentaje de Energía Renovable que utiliza es:")
                            .font(.subheadline)
                            .bold()
                        Text(info.energiarenobable)
                            .font(.caption)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text("♻️ El porcentaje del Empaque Reciclado es de:")
                            .font(.subheadline)
                            .bold()
                        Text(info.empaquereciclado)
                            .font(.caption)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text("💧 Porcentaje de Agua Reusada en la empresa:")
                            .font(.subheadline)
                            .bold()
                        Text(info.aguareuso)
                            .font(.caption)
                    }
                }
            }
            .padding()
        }
    }
}
