//
//  RewardCircleComponent.swift
//  Bimbo
//
//  Created by Jesus Ortega on 13/05/25.
//

import SwiftUI

struct RewardCircleComponent: View {
    let rewardPicture: String
    let rewardPoits: Int
    @Binding var rewardStatus: isClaimed
    var body: some View {
        rewardStatus.rewardStatusView(imageName: rewardPicture, points: rewardPoits)
    }
}

enum isClaimed{
    case notClaimed
    case claimed
    
    func rewardStatusView(imageName: String, points: Int) -> some View{
        switch self{
        case .notClaimed:
            return AnyView(
                HStack {
                    CirculoConImagen(nombreImagen: imageName, isClaimed: false)
                        .padding(.leading, 10)
                    
                    LineDirection.horizontal.dottedLine()
                    
                    Spacer()
                    
                    HStack {
                        Image("pancito")
                            .resizable()
                            .frame(width: 20, height: 20) // Más pequeño
                        
                        Text("\(points)")
                            .font(.custom("futura", size: 20)) // Más grande
                            .foregroundColor(.primary)
                    }
                    .frame(width: 90, height: 40)
                    .padding(3)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                }
                .frame(maxWidth: .infinity, maxHeight: 160)
                .padding(.trailing, 20)

            )
            
        case .claimed:
            return AnyView(
                HStack{
                    CirculoConImagen(nombreImagen: imageName, isClaimed: true)
                        .padding(.leading, 10)
                    LineDirection.horizontal.dottedLine()
                    Spacer()
                    HStack{
                        Image("pancito")
                            .resizable()
                        Text("\(points)")
                            .font(.custom("futura", size: 20))
                    }.frame(width: 80, height: 40)
                        .padding(3)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(8)
                }.frame(maxWidth: .infinity, maxHeight: 150)
                    .padding(.trailing, 20)
                
            )
        }
    }
}

// AUXILIARES ==========

struct CirculoConImagen: View {
    var nombreImagen: String
    var isClaimed: Bool
    
    var body: some View {
        Circle()
            .stroke(style: StrokeStyle(lineWidth: 4, dash: [5]))
            .foregroundColor(.blue)
            .frame(width: 100, height: 100)
            .overlay(
                Image(isClaimed ? "ositoFace" : nombreImagen)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 890)
                    .clipShape(Circle())
            )
    }
}
enum LineDirection {
    case horizontal
    case vertical
    
    func dottedLine(color: Color = .blue, lineWidth: CGFloat = 2, dashPattern: [CGFloat] = [7]) -> some View {
        switch self {
        case .horizontal:
            return AnyView(
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: dashPattern))
                    .foregroundColor(color)
                    .frame(height: lineWidth)
                    .frame(maxWidth: .infinity)
            )
            
        case .vertical:
            return AnyView(
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: dashPattern))
                    .foregroundColor(color)
                    .frame(width: lineWidth)
                    .frame(maxHeight: .infinity)
            )
        }
    }
}

#Preview {
    RewardCircleComponent(rewardPicture: "location", rewardPoits: 1, rewardStatus: .constant(.notClaimed))
    //CirculoConImagen(nombreImagen: "location")
}
