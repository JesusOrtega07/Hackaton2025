//
//  Productos.swift
//  Bimbo
//
//  Created by Dan Figueroa on 13/05/25.
//

import SwiftUI

struct Productos: View {
    @State private var showWebView = true
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Button("Listo") {
                    showWebView = true
                }
                .frame(width: 100)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Salir") {
                    dismiss()
                }
                .frame(width: 100)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            }

            
        }
        .padding()
        .sheet(isPresented: $showWebView) {
            WebView(url: URL(string: "https://www.bimbo.es/marcas/bimbo/pan-bimbo-blanco-con-corteza")!)
        }
    }
}

#Preview {
    Productos()
}
