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
    let rewardStatus: isClaimed
    var body: some View {
        rewardStatus.rewardStatusView(imageName: "location", points: 100)
    }
}

enum isClaimed{
    case notClaimed
    case claimed
    
    func rewardStatusView(imageName: String, points: Int) -> some View{
        switch self{
        case .notClaimed:
            return AnyView(
                HStack(){
                    CirculoConImagen(nombreImagen: imageName)
                        .padding(.leading, 10)
                    Text("Hola")
                }.frame(maxWidth: .infinity, maxHeight: 150)
            )
            
        case .claimed:
            return AnyView(
                HStack{
                    CirculoConImagen(nombreImagen: imageName)
                        .padding(.leading, 10)
                    LineDirection.horizontal.dottedLine()
                    Spacer()
                }.frame(maxWidth: .infinity, maxHeight: 150)
            )
        }
    }
}

// AUXILIARES ==========

struct CirculoConImagen: View {
    var nombreImagen: String  // Variable que recibe el nombre de la imagen
    
    var body: some View {
        Circle()
            .stroke(style: StrokeStyle(lineWidth: 4, dash: [5]))
            .foregroundColor(.blue)
            .frame(width: 100, height: 100)
            .overlay(
                Image(nombreImagen)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            )
    }
}

enum LineDirection {
    case horizontal
    case vertical
    
    func dottedLine(color: Color = .blue, lineWidth: CGFloat = 2, dashPattern: [CGFloat] = [5]) -> some View {
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
    RewardCircleComponent(rewardPicture: "location", rewardPoits: 1, rewardStatus: .claimed)
    //CirculoConImagen(nombreImagen: "location")
}
