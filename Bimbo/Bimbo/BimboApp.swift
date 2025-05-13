//
//  BimboApp.swift
//  Bimbo
//
//  Created by Jesus Ortega on 12/05/25.
//

import SwiftUI

@main
struct BimboApp: App {
    var body: some Scene {
        WindowGroup {
            RewardsView(puntosVM: Puntos())
    }
}
