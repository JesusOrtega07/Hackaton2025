//
//  Temporal.swift
//  Bimbo
//
//  Created by Jesus Ortega on 13/05/25.
//

import SwiftUI
import Vision
import AVFoundation

struct Temporal: View {
    @State private var selectedImage: UIImage?
    @State private var classificationResult: String = "Toma una foto"
    @State private var confidence: Double = 0.0
    @State private var showingCamera = false
    
    var body: some View {
        VStack {
            Button(action: {
                showingCamera = true // Importante
            }) {
                HStack {
                    Image(systemName: "camera")
                    Text("Tomar foto")
                }
            }
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Resultado:")
                    .font(.headline)
                Text(classificationResult) // Resultado
                Text("Confianza: \(String(format: "%.2f", confidence * 100))%")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .fullScreenCover(isPresented: $showingCamera) { // Importante
            CameraView(selectedImage: $selectedImage)
                .onDisappear {
                    if let image = selectedImage, let ciImage = CIImage(image: image) {
                        Task {
                            await classifyImage(ciImage)
                        }
                    }
                }
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

struct CameraView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.dismiss) private var dismiss
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        picker.cameraCaptureMode = .photo
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: CameraView
        
        init(_ parent: CameraView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Temporal()
    }
}
