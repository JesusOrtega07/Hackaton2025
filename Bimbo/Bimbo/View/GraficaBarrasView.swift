//
//  GraficaBarrasView.swift
//  Bimbo
//
//  Created by Dan Figueroa on 13/05/25.
//

import SwiftUI
import Charts

struct Indicador: Identifiable {
    var id = UUID()
    var nombre: String
    var anio: Int
    var valor: Double
}

struct GraficaBarrasView: View {
    let indicadores: [Indicador] = [
        // Portafolio sin colorantes
        Indicador(nombre: "Colorantes", anio: 2023, valor: 98),
        
        // Beneficiados por programas
        Indicador(nombre: "Beneficiados", anio: 2023, valor: 440000),
        
        // Energía sustentable
        Indicador(nombre: "Energía Sustentable", anio: 2022, valor: 85),
        Indicador(nombre: "Energía Sustentable", anio: 2023, valor: 92),

        // Empaques reciclables
        Indicador(nombre: "Empaques Reciclables", anio: 2020, valor: 90),
        Indicador(nombre: "Empaques Reciclables", anio: 2022, valor: 91),
        Indicador(nombre: "Empaques Reciclables", anio: 2023, valor: 93),

        // Agua reusada
        Indicador(nombre: "Agua Reusada", anio: 2020, valor: 82.8),
        Indicador(nombre: "Agua Reusada", anio: 2022, valor: 92.5)
    ]
    
    // Extraemos categorías únicas una vez
    var categorias: [String] {
        Array(Set(indicadores.map { $0.nombre })).sorted()
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(categorias, id: \.self) { categoria in
                        Text(categoria)
                            .font(.headline)
                            .padding(.top)

                        let datos = indicadores.filter { $0.nombre == categoria }

                        Chart(datos) { dato in
                            BarMark(
                                x: .value("Año", dato.anio),
                                y: .value("Valor", dato.valor)
                            )
                            .annotation(position: .top) {
                                Text(String(format: "%.1f", dato.valor))
                                    .font(.caption)
                            }
                        }
                        .frame(height: 200)
                    }
                }
                .padding()
            }
            .navigationTitle("Indicadores Bimbo 2020–2023")
        }
    }
}

#Preview {
    GraficaBarrasView()
}
