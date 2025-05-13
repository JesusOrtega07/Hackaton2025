//
//  BimboPrincipal.swift
//  Bimbo
//
//  Created by Dan Figueroa on 13/05/25.
//

import SwiftUI

struct BimboPrincipal: View {
    @State private var showMap = false
    @State private var showEstadisticas = false

    var body: some View {
        ZStack {
            Color.bimboBlue
                .ignoresSafeArea()

            VStack(spacing: 0) {
                ZStack(alignment: .top) {
                    Image("eslogan")
                        .resizable()
                        .frame(width: 300, height: 200)
                        .padding(.top, 60)

                    HStack(spacing: 90) {
                        Rectangle()
                            .frame(width: 140, height: 50)
                            .cornerRadius(40)
                            .opacity(0.5)
                            .overlay(
                                UserProfileStyleComponent(imageName: "user", name: "Meliza Gonzales", style: .horizontal)
                                    .frame(width: 120, height: 120)
                                
                            )
                        

                        Rectangle()
                            .frame(width: 140, height: 50)
                            .cornerRadius(40)
                            .opacity(0.5)
                            .overlay(
                                HStack(spacing:15){
                                    Text("0")
                                        .foregroundColor(.bimboWhite)
                                        .bold()
                                        .font(.title)
                                    Image("pancito")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                }
                            )
                    }
                }
                ZStack {
                    Color.bimboWhite
                        .cornerRadius(30)
                        .ignoresSafeArea(edges: .bottom)

                    VStack {
                        Text("IMPACTO")
                            .foregroundColor(.bimboBluerey)
                            .bold()
                            .padding(.top, 10)
                            .padding(.trailing,250)

                        YouTubeScrollView()
                        
                        Divider()
                            
                        
                        Text("EXPLORA MAS")
                            .foregroundColor(.bimboBluerey)
                            .bold()
                            .padding(.top, 10)
                            .padding(.trailing,210)
                        
                        HStack {
                            Button {
                                // Acción para el botón con imagen "64"
                            } label: {
                                Rectangle()
                                    .foregroundColor(Color.bimboazulito)
                                    .overlay(
                                        Image("64")
                                            .resizable()
                                            .frame(width: 150, height: 150)
                                    )
                                    .frame(width: 180, height: 190)
                                    .cornerRadius(40)
                                    .padding(.top, 12)
                                    .padding(.trailing, 10)
                            }

                            VStack {
                                Button {
                                    showEstadisticas = true
                                } label: {
                                    Rectangle()
                                        .foregroundColor(Color.bimboazulito)
                                        .overlay(
                                            Image("65")
                                                .resizable()
                                                .frame(width: 130, height: 70)
                                        )
                                        .frame(width: 180, height: 90)
                                        .cornerRadius(40)
                                        .padding(.top, 12)
                                }

                                Button {
                                    showMap = true
                                } label: {
                                    Rectangle()
                                        .foregroundColor(Color.bimboazulito)
                                        .overlay(
                                            Image("66")
                                                .resizable()
                                                .frame(width: 130, height: 70)
                                        )
                                        .frame(width: 180, height: 70)
                                        .cornerRadius(40)
                                        .padding(.top, 12)
                                }
                            }
                        }
                        
                        Button {
                            // Acción del botón
                        } label: {
                            HStack {
                                Text("Escanea, Aprende y Gana")
                                    .foregroundColor(.white)
                                Image("camarabimbo")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(20)
                        }.padding(.top,15)

                        
                        
                        

                        
                    }
                }
                .frame(maxHeight: .infinity)
            }
        }
        .fullScreenCover(isPresented: $showMap) {
            MapWithMarkersView()
        }
        .fullScreenCover(isPresented: $showEstadisticas) {
            GraficaBarrasView()
        }
    }
}

#Preview {
    BimboPrincipal()
}
