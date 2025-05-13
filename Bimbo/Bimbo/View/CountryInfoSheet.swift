//
//  CountryInfoSheet.swift
//  Bimbo
//
//  Created by Dan Figueroa on 13/05/25.
//

import SwiftUI

struct CountryInfoSheet: View {
    let country: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Información de \(country)")
                .font(.largeTitle)
                .bold()
            
            Text("Aquí puedes poner más detalles personalizados sobre \(country), como datos demográficos, eventos, noticias, etc.")
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

/*#Preview {
    CountryInfoSheet(country: "Mexico")
}
*/
