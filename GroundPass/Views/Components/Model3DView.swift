//
//  Model3D.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 14/1/26.
//

import SwiftUI
import RealityKit


struct Model3DView: UIViewRepresentable {
    var modelName: String

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        arView.environment.background = .color(.background)
        
        guard let url = Bundle.main.url(forResource: modelName, withExtension: "usdz") else {
            return arView
        }
        
        let modelEntity: ModelEntity
        do {
            modelEntity = try ModelEntity.loadModel(contentsOf: url)
        } catch {
            return arView
        }

        let anchor = AnchorEntity(world: [0, 0, 0])
        anchor.addChild(modelEntity)
        arView.scene.addAnchor(anchor)
        
        context.coordinator.modelEntity = modelEntity

        let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePan(_:)))
        arView.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePinch(_:)))
        arView.addGestureRecognizer(pinchGesture)

        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Model3DCoordinator {
        Model3DCoordinator()
    }
    
    // MARK: - Model 3D Coordinator
    class Model3DCoordinator: NSObject {
        var modelEntity: ModelEntity?
        
        @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
            guard let entity = modelEntity else { return }
            let translation = gesture.translation(in: gesture.view)
            
            let horizontalAngle = Float(translation.x) * (Float.pi / 180) * 0.5 // eje Y
            let verticalAngle = Float(translation.y) * (Float.pi / 180) * 0.5   // eje X
            
            let horizontalRotation = simd_quatf(angle: horizontalAngle, axis: [0,1,0])
            let verticalRotation = simd_quatf(angle: verticalAngle, axis: [1,0,0])
            
            entity.transform.rotation = horizontalRotation * entity.transform.rotation * verticalRotation
            
            gesture.setTranslation(.zero, in: gesture.view)
        }
        
        @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
            guard let entity = modelEntity else { return }
            let scale = Float(gesture.scale)
            entity.scale *= SIMD3<Float>(repeating: scale)
            gesture.scale = 1.0
        }
    }
}
