//
//  PreguntasViewModel.swift
//  Bimbo
//
//  Created by Dan Figueroa on 13/05/25.
//

import Foundation

class QuestionViewModel: ObservableObject {
    struct Question {
        let texto: String
        let opciones: [String]
        let respuestaCorrecta: Int
    }

    @Published var preguntaActual: Question
    @Published var esCorrecto: Bool?
    @Published var respuestaBloqueada = false

    private let preguntas: [Question] = [
        Question(
            texto: "¿La informacion nutrimental indica que este plan es bajo en grasa o libre de grasa trans?",
            opciones: ["Si", "No"],
            respuestaCorrecta: 0
        ),
        Question(
            texto: "¿Este producto aporta alguna cantidad de hierro u otro micronutriente en su tabla nutrimental?",
            opciones: ["No", "Si"],
            respuestaCorrecta: 1
        )
    ]

    init() {
        preguntaActual = preguntas.randomElement()!
    }

    func verificarRespuesta(_ index: Int) {
        guard !respuestaBloqueada else { return }
        respuestaBloqueada = true
        esCorrecto = index == preguntaActual.respuestaCorrecta
    }

    func nuevaPregunta() {
        preguntaActual = preguntas.randomElement()!
        esCorrecto = nil
        respuestaBloqueada = false
    }
}
