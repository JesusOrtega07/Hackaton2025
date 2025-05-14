//
//  preguntas.swift
//  Bimbo
//
//  Created by Dan Figueroa on 13/05/25.
//

import SwiftUI

struct Preguntas: View {
    @StateObject private var questionVM = QuestionViewModel()
    @State private var respuestaMostrada = false
    
    var body: some View {
        VStack(spacing: 15) {
            Text(questionVM.preguntaActual.texto)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            ForEach(0..<2, id: \.self) { index in
                Button(action: {
                    questionVM.verificarRespuesta(index)
                    respuestaMostrada = true
                }) {
                    Text(questionVM.preguntaActual.opciones[index])
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .disabled(respuestaMostrada)
            }
            
            if respuestaMostrada {
                Text(questionVM.esCorrecto == true ? "¡Correcto!" : "Incorrecto")
                    .font(.subheadline)
                    .foregroundColor(questionVM.esCorrecto == true ? .green : .red)
                
                Button("Siguiente") {
                    questionVM.nuevaPregunta()
                    respuestaMostrada = false
                }
                .padding(.top, 5)
            }
        }
        .padding()
        .frame(width: 300, height: 300)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
        )
    }
}

#Preview {
    Preguntas()
}
