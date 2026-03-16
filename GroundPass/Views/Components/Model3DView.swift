//
//  Model3D.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 14/1/26.
//

import SwiftUI
import RealityKit


struct Model3DView: UIViewRepresentable {
    let localURL: URL?
    let key: String
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        arView.environment.background = .color(.background)
        
        guard let localURL = localURL else {
            return arView
        }
        
        let modelEntity: ModelEntity
        do {
            modelEntity = try ModelEntity.loadModel(contentsOf: localURL)
        } catch {
            return arView
        }

        let anchor = AnchorEntity(world: [0, 0, 0])
        anchor.addChild(modelEntity)
        arView.scene.addAnchor(anchor)
        normalizeScale(for: modelEntity)

        context.coordinator.modelEntity = modelEntity

        let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePan(_:)))
        arView.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePinch(_:)))
        arView.addGestureRecognizer(pinchGesture)

        return arView
    }
    
    private func normalizeScale(for entity: ModelEntity, targetSize: Float = 0.03) {
        let bounds = entity.visualBounds(relativeTo: nil)
        let maxDimension = max(bounds.extents.x, bounds.extents.y, bounds.extents.z)
        guard maxDimension > 0 else {
            entity.scale = SIMD3<Float>(repeating: 0.01)
            return
        }
        entity.scale = SIMD3<Float>(repeating: targetSize / maxDimension)
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
