//
//  JuegoPrincipalViewModel.swift
//  Raiva
//
//  Created by Dan Figueroa on 01/04/25.
//

import Foundation

class JuegoPrincipalViewModel: ObservableObject {
    @Published var user: User?
    @Published var leftCoins: Int = 0  // Monedas del jugador izquierdo
    @Published var rightCoins: Int = 0
    @Published var leftScore: Int = 0
    @Published var rightScore: Int = 0
    @Published var leftMoveY: Int = 130
    @Published var rightMoveY: Int = 130
    
    private let minY: Int = -80
    private let maxY: Int = 130
  
    
    //subir
    func subirIzquierdo(cantidad: Int = 90) {
        guard leftMoveY > minY else { return }
        leftMoveY -= cantidad
        leftScore += 1
        darMonedaIzquierda()
    }
        
    func subirDerecho(cantidad: Int = 90) {
        guard rightMoveY > minY else { return }
        rightMoveY -= cantidad
        rightScore += 1
        darMonedaDerecha()
    }
        
    private func darMonedaDerecha() {
        rightCoins += 100
    }
        
    private func darMonedaIzquierda() {
        leftCoins += 100
    }
        
    func reiniciarPosiciones() {
        leftMoveY = maxY
        rightMoveY = maxY
    }
      
    func reiniciarScores() {
        leftScore = 0
        rightScore = 0
    }
        
        // Opcional: función para reiniciar monedas
    func reiniciarMonedas() {
        leftCoins = 0
        rightCoins = 0
    }
}
