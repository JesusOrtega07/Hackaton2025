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
    @State private var showReward = false
    @State private var selectedImage: UIImage?
    @State private var classificationResult: String = "Toma una foto"
    @State private var confidence: Double = 0.0
    @State private var showingCameraModel = false
    @State private var showProductModel = false
    @State private var showProductosView = false

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
                                Color.bimboBlack.opacity(0.4)
                            ).clipShape(RoundedRectangle(cornerRadius: 40))
                            .frame(maxWidth: 250,maxHeight: 65)
                        
                        Button {
                            showReward = true
                        } label: {
                            Rectangle()
                                .frame(width: 140, height: 50)
                                .foregroundColor(.bimboBlack)
                                .cornerRadius(40)
                                .opacity(0.4)
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
                        }

                    }.padding([.leading,.trailing], 20)
                }
                ZStack {
                    Color.bimboWhite
                        .cornerRadius(30)
                        .ignoresSafeArea(edges: .bottom)
                    
                    VStack {
                        Text(classificationResult)
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
                                showProductModel = true
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
                            showingCameraModel = true
                        }) {
                            HStack {
                                Text("Aprende y Gana")
                                    .font(.custom("Futura", size: 20))
                                    .foregroundColor(.white)
                                
                                Image("camarabimbo")
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
        .fullScreenCover(isPresented: $showProductModel) {
            CameraView(selectedImage: $selectedImage)
                .onDisappear {
                    showProductosView = true
                }
        }
        .fullScreenCover(isPresented: $showProductosView) {
            Productos() // Aquí muestras tu vista de productos
        }
        .fullScreenCover(isPresented: $showingCameraModel) {
            CameraView(selectedImage: $selectedImage)
                .onDisappear {
                    if let image = selectedImage, let ciImage = CIImage(image: image) {
                        Task {
                            await classifyImage(ciImage)
                        }
                    }
                }
        }
        .fullScreenCover(isPresented: $showReward) {
            RewardsView(puntosVM: Puntos())
        }
    }
    
    private func classifyImage(_ image: CIImage) async {
        guard let model = try? VNCoreMLModel(for: BimboIA(configuration: MLModelConfiguration()).model) else {
            classificationResult = "Error al cargar el modelo"
            return
        }
        
        let request = VNCoreMLRequest(model: model) { request, error in
            if let error = error {
                classificationResult = "Error: \(error.localizedDescription)"
                return
            }
            
            guard let results = request.results as? [VNClassificationObservation],
                  let topResult = results.first else {
                classificationResult = "No se pudieron interpretar los resultados"
                return
            }
            
            DispatchQueue.main.async {
                classificationResult = topResult.identifier
                confidence = Double(topResult.confidence)
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            classificationResult = "Error al procesar la imagen: \(error.localizedDescription)"
        }
    }
    
}

#Preview {
    BimboPrincipal()
}
