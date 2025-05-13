//
//  LogIn.swift
//  Bimbo
//
//  Created by Dan Figueroa on 13/05/25.
//

import SwiftUI

struct Register: View {
    @State private var rememberMe = false
    @State private var norobot = false
    @State private var username = ""
    @State private var password = ""
    @State private var showVP = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Color.bimboazulito
                .ignoresSafeArea()
            
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.black.opacity(0.7))
                    .clipShape(Circle())
                    .shadow(radius: 4)
            }
            .position(x: 40, y: 30)

            VStack {
                Image("logobimbo")
                    .padding(.top, 40)
                Spacer()

                ZStack {
                    Rectangle()
                        .foregroundColor(Color.bimboazulito)
                        .frame(width: 400, height: 480)
                        .cornerRadius(26)

                        .overlay(
                            VStack(spacing: 20) {
                                Text("Registro")
                                    .foregroundColor(Color.bimboBlue)
                                    .bold()
                                    .font(.largeTitle)
                                    .padding(.top, -80)
                                
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


                                CustomButton(
                                    action: {
                                        showVP = true
                                    },
                                    style: .standard(
                                        fontColor: .bimboazulito,
                                        backgroundColor: .bimboBlue,
                                        buttonName: "Continuar"
                                    )
                                )
                                .frame(width: 300)
                            }
                            
                        )
                    
                    
                }

                Spacer()
            }
        }.fullScreenCover(isPresented: $showVP) {
            BimboPrincipal()
        }
    }
}

#Preview {
    Register()
}
