//
//  LogIn.swift
//  Bimbo
//
//  Created by Dan Figueroa on 13/05/25.
//

import SwiftUI

struct LogIn: View {
    @State private var rememberMe = false
    @State private var norobot = false
    @State private var username = ""
    @State private var password = ""
    @State private var isRegisterViewPresented = false

    var body: some View {
        ZStack {
            Color.bimboazulito
                .ignoresSafeArea()

            VStack {
                Image("logobimbo")
                    .padding(.top, 40)
                Spacer()

                ZStack {
                    Rectangle()
                        .foregroundColor(Color.bimboazulito)
                        .frame(width: 400, height: 480)
                        .cornerRadius(26)
                        //.offset(y: 70) // Eliminado para subir el rectángulo
                        .overlay(
                            VStack(spacing: 20) {
                                Text("Iniciar sesión")
                                    .foregroundColor(Color.bimboBlue)
                                    .bold()
                                    .font(.largeTitle)
                                    .padding(.top, -80) // Antes era 130, ahora es más arriba

                                CustomTextField(
                                    title: "Ingresa tu usuario",
                                    placeholder: "",
                                    text: $username,
                                    type: .normal,
                                    backgroundColor: Color.bimboBlue.opacity(0.8),
                                    foregroundColor: .white,
                                    tittleColor: .black,
                                    width: 300,
                                    borderColor: Color.bimboazulito
                                )

                                CustomTextField(
                                    title: "Ingresa tu contraseña",
                                    placeholder: "",
                                    text: $password,
                                    type: .secure,
                                    backgroundColor: Color.bimboBlue.opacity(0.8),
                                    foregroundColor: .white,
                                    tittleColor: .black,
                                    width: 300,
                                    borderColor: Color.bimboazulito
                                )

                                CustomCheckbox(label: "No soy un robot", isChecked: $norobot)
                                    .padding(.leading, -130)

                                ZStack {
                                    CustomButton(
                                        action: {
                                            isRegisterViewPresented = true
                                        },
                                        style: .standard(
                                            fontColor: .bimboBlue,
                                            backgroundColor: .bimboazulito,
                                            buttonName: "regístrate"
                                        )
                                    )
                                    .padding(.leading, 170)

                                    Text("¿Aun no eres miembro?")
                                        .foregroundColor(.bimboBlue)
                                        .padding(.leading, -100)
                                }
                                .frame(height: 40)

                                CustomButton(
                                    action: {},
                                    style: .standard(
                                        fontColor: .bimboazulito,
                                        backgroundColor: .bimboBlue,
                                        buttonName: "continuar"
                                    )
                                )
                                .frame(width: 300)
                            }
                        )
                }

                Spacer()
            }
        }
    }
}

#Preview {
    LogIn()
}
