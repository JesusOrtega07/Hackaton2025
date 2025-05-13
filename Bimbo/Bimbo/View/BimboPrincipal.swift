//
//  BimboPrincipal.swift
//  Bimbo
//
//  Created by Dan Figueroa on 13/05/25.
//

import SwiftUI
import Vision
import AVFoundation


struct BimboPrincipal: View {
    @ObservedObject var puntosVM = Puntos()
    @State private var showMap = false
    @State private var showEstadisticas = false
    @State private var showProductos = false

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
                        UserProfileStyleComponent(imageName: "eslogan", name: "Jesús Ortega", style: .horizontal)
                            .background(
                                Color.black.opacity(0.4)
                            ).clipShape(RoundedRectangle(cornerRadius: 40))
                            .frame(maxWidth: 250,maxHeight: 65)
                        Rectangle()
                            .frame(width: 140, height: 50)
                            .cornerRadius(40)
                            .opacity(0.5)
                            .overlay(
                                HStack(spacing:15){
                                    Text("\(puntosVM.puntos)")
                                        .foregroundColor(.bimboWhite)
                                        .bold()
                                        .font(.title)
                                    Image("pancito")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                }
                            )
                    }.padding([.leading,.trailing], 20)
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
                                showProductos = true
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
                        
                        Button(action: {
                            //showingCamera = true
                        }) {
                            HStack {
                                Text("Aprende y Gana")
                                    .font(.custom("Futura", size: 20))
                                    .foregroundColor(.white)
                                
                                Image(systemName: "camera")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(20)
                        }
                        .padding(.top,15)
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
        .fullScreenCover(isPresented: $showProductos) {
            Productos()
        }
    }
}

#Preview {
    BimboPrincipal()
}
