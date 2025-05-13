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
    @Environment(\.dismiss) var dismiss  // Para el botón de regreso
    
    let indicadores: [Indicador] = [
        Indicador(nombre: "Colorantes", anio: 2023, valor: 98),
        Indicador(nombre: "Beneficiados", anio: 2023, valor: 440000),
        Indicador(nombre: "Energía Sustentable", anio: 2022, valor: 85),
        Indicador(nombre: "Energía Sustentable", anio: 2023, valor: 92),
        Indicador(nombre: "Empaques Reciclables", anio: 2020, valor: 90),
        Indicador(nombre: "Empaques Reciclables", anio: 2022, valor: 91),
        Indicador(nombre: "Empaques Reciclables", anio: 2023, valor: 93),
        Indicador(nombre: "Agua Reusada", anio: 2020, valor: 82.8),
        Indicador(nombre: "Agua Reusada", anio: 2022, valor: 92.5)
    ]
    
    var categorias: [String] {
        Array(Set(indicadores.map { $0.nombre })).sorted()
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Button(action: {
                        dismiss()  // Acción para regresar
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Regresar")
                        }
                        .foregroundColor(.blue)
                    }
                    .padding(.bottom)
                    
                    ForEach(categorias, id: \.self) { categoria in
                        Text(categoria)
                            .font(.headline)
                            .padding(.top)

                        let datos = indicadores.filter { $0.nombre == categoria }

                        Chart {
                            ForEach(datos, id: \.id) { dato in
                                BarMark(
                                    x: .value("Año", dato.anio),
                                    y: .value("Valor", dato.valor)
                                )
                                .annotation(position: .top) {
                                    Text(String(format: "%.1f", dato.valor))
                                        .font(.caption)
                                }
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
