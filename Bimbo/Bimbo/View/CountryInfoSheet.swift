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
        VStack(alignment: .leading, spacing: 15) {
            Text("🌍 Información de \(info.region.rawValue)")
                .font(.title)
                .bold()

            Divider()

            Group {
                Text("🧃 Portafolio:")
                    .font(.headline)
                Text(info.portafolio)

                Text("🤝 Buen Vecino:")
                    .font(.headline)
                Text(info.buenvecino)

                Text("⚡ Energía Renovable:")
                    .font(.headline)
                Text(info.energiarenobable)

                Text("♻️ Empaque Reciclado:")
                    .font(.headline)
                Text(info.empaquereciclado)

                Text("💧 Agua Reusada:")
                    .font(.headline)
                Text(info.aguareuso)
            }

            Spacer()
        }
        .padding()
    }
}

