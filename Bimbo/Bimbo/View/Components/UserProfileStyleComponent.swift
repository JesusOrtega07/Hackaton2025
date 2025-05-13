//
//  UserProfileStyleComponent.swift
//  Bimbo
//
//  Created by Jesus Ortega on 13/05/25.
//

import SwiftUI

struct UserProfileStyleComponent: View {
    let imageName: String
    let name: String
    let style: ProfileDisplayStyle

    var body: some View {
        style.profileView(imageName: imageName, name: name)
    }
}
    enum ProfileDisplayStyle {
        case vertical
        case horizontal
        
        func profileView(imageName: String, name: String) -> some View {
            switch self {
                
            case .vertical:
                return AnyView(
                    VStack {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.green.opacity(0.5), lineWidth: 5)
                            )
                        Text(name)
                            .bold()
                            .font(.custom("Futura", size: 20))
                            .foregroundColor(.white)
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                    }
                    .frame(maxWidth: .infinity)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal)
                )
                
            case .horizontal:
                return AnyView(
<<<<<<< HEAD
                    GeometryReader { geometry in
                        HStack(spacing: 12) { // Espacio fijo entre elementos para mejor legibilidad
                            // Imagen circular
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(
                                    width: min(geometry.size.height, geometry.size.width * 0.3),
                                    height: min(geometry.size.height, geometry.size.width * 0.3)
                                )
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.green.opacity(0.5), lineWidth: 2)
                                )
                                .padding(.leading, 8)
                            
                            // Texto
                            Text(name)
                                .bold()
                                .font(.custom("Futura", size: 30))
                                .foregroundColor(.white)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .background(Color.gray.opacity(0.1)) // Para visualizar el área ocupada
                    }
                )
=======
                                GeometryReader { geometry in
                                    let containerSize = min(geometry.size.width, geometry.size.height)
                                    
                                    HStack(spacing: containerSize * 0.05) {
                                        Image(imageName)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: containerSize * 0.3, height: containerSize * 0.3)
                                            .clipShape(Circle())
                                            .overlay(
                                                Circle()
                                                    .stroke(Color.green.opacity(0.5), lineWidth: containerSize * 0.015)
                                            )
                                        
                                        Text(name)
                                            .bold()
                                            .font(.custom("Gagalin", size: containerSize * 0.1))
                                            .foregroundColor(Color.red)
                                            .minimumScaleFactor(1.5)
                                            .lineLimit(1)
                                        
                                        Spacer()
                                    }
                                    .padding(containerSize * 0.05)
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                }
                            )
>>>>>>> bb33a35 (login and register ready ando usertype)
            }
        }
    }

#Preview {
    UserProfileStyleComponent(imageName: "", name: "Meliza Gonzales", style: .horizontal)
}
