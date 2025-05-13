//
//  BimboPrincipal.swift
//  Bimbo
//
//  Created by Dan Figueroa on 13/05/25.
//

import SwiftUI

struct BimboPrincipal: View {
    @State private var showMap = false

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
                        
                        Spacer()

                        Button("Ver Mapa") {
                            showMap = true
                        }
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        .padding(.bottom, 40)
                    }
                }
                .frame(maxHeight: .infinity)
            }
        }
        .fullScreenCover(isPresented: $showMap) {
            MapWithMarkersView()
        }
    }
}

#Preview {
    BimboPrincipal()
}
