//
//  RewardsView.swift
//  Bimbo
//
//  Created by Jesus Ortega on 13/05/25.
//

import SwiftUI

struct RewardsView: View {
    @ObservedObject var puntosVM: Puntos
    @State var variables : [isClaimed] = [.notClaimed, .notClaimed, .notClaimed, .notClaimed, .notClaimed, .notClaimed, .notClaimed, .notClaimed, .notClaimed, .notClaimed, ]
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack(alignment: .top) {
            Color.bimboBlue
                .ignoresSafeArea()
        
            VStack{
                // Agregar el botón de retroceso @Dan ejej
                Button(action: {
                    dismiss()
                }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .clipShape(Circle())
                }
                .padding(.trailing, 290)
                .zIndex(1)
                HStack{
                    HStack(spacing: 20) {
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
                    }.padding([.leading,.trailing], 15)
                }
                .padding(.bottom, 30)
                Spacer()
                ZStack{
                    Color.bimboazulito
                        .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                                .edgesIgnoringSafeArea(.bottom)
                    ScrollView {
                        
                        Button {
                            puntosVM.puntos = puntosVM.puntos - 100
                            print(puntosVM.puntos)
                            variables[0] = .claimed
                        } label: {
                            RewardCircleComponent(
                                rewardPicture: "Rebanadas",
                                rewardPoits: 100,
                                rewardStatus: $variables[0]
                            )
                        }
                        line()
                        
                        Button {
                            puntosVM.puntos = puntosVM.puntos - 300
                            print(puntosVM.puntos)
                            variables[1] = .claimed
                        } label: {
                            RewardCircleComponent(
                                rewardPicture: "Nito",
                                rewardPoits: 300,
                                rewardStatus: $variables[1]
                            )
                        }
                        line()
                        
                        Button {
                            puntosVM.puntos = puntosVM.puntos - 500
                            print(puntosVM.puntos)
                            variables[2] = .claimed
                        } label: {
                            RewardCircleComponent(
                                rewardPicture: "Mantecadas",
                                rewardPoits: 500,
                                rewardStatus: $variables[2]
                            )
                        }
                        line()
                        
                        Button {
                            puntosVM.puntos = puntosVM.puntos - 700
                            print(puntosVM.puntos)
                            variables[3] = .claimed
                        } label: {
                            RewardCircleComponent(
                                rewardPicture: "Rosquitas",
                                rewardPoits: 700,
                                rewardStatus: $variables[3]
                            )
                        }
                        line()
                        
                        Button {
                            puntosVM.puntos = puntosVM.puntos - 900
                            print(puntosVM.puntos)
                            variables[4] = .claimed
                        } label: {
                            RewardCircleComponent(
                                rewardPicture: "Donitas",
                                rewardPoits: 900,
                                rewardStatus: $variables[4]
                            )
                        }
                        line()
                        
                        Button {
                            puntosVM.puntos = puntosVM.puntos - 1100
                            print(puntosVM.puntos)
                            variables[5] = .claimed
                        } label: {
                            RewardCircleComponent(
                                rewardPicture: "Tortillinas",
                                rewardPoits: 1100,
                                rewardStatus: $variables[5]
                            )
                        }
                        line()
                        
                        Button {
                            puntosVM.puntos = puntosVM.puntos - 1300
                            print(puntosVM.puntos)
                            variables[6] = .claimed
                        } label: {
                            RewardCircleComponent(
                                rewardPicture: "Pan tostado",
                                rewardPoits: 1300,
                                rewardStatus: $variables[6]
                            )
                        }
                        line()
                        
                        Button {
                            puntosVM.puntos = puntosVM.puntos - 1500
                            print(puntosVM.puntos)
                            variables[7] = .claimed
                        } label: {
                            RewardCircleComponent(
                                rewardPicture: "Pan blanco bimbo",
                                rewardPoits: 1500,
                                rewardStatus: $variables[7]
                            )
                        }
                        line()
                        
                        Button {
                            puntosVM.puntos = puntosVM.puntos - 1300
                            print(puntosVM.puntos)
                            variables[8] = .claimed
                        } label: {
                            RewardCircleComponent(
                                rewardPicture: "Tostadas sanissimo",
                                rewardPoits: 1300,
                                rewardStatus: $variables[8]
                            )
                        }
                    }
.frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.top, 30)
                        .padding([.leading, .trailing], 20)
                    
                }
            }.frame(maxHeight: .infinity)
        }
    }
    
    func line() -> some View {
        HStack {
            LineDirection.vertical.dottedLine()
                .frame(height: 80)
                .padding([.leading, .trailing], 60)
            Spacer()
        }
    }
}

#Preview {
    RewardsView(puntosVM: Puntos())
}
