//
//  ARView.swift
//  MJ_APP
//
//  Created by admin on 6/1/2023.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity
struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {

        let view = ARView()
        // Start AR session
        let session = view.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        session.run(config)
        
        // Add coaching overlay
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = session
        coachingOverlay.goal = .horizontalPlane
        view.addSubview(coachingOverlay)

        // Handle ARSession events via delegate
        context.coordinator.view = view
        session.delegate = context.coordinator
        
        // Handle taps
        view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: context.coordinator,
                action: #selector(Coordinator.handleTap)
            )
        )
        
        return view

    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        weak var view: ARView?
        var focusEntity: FocusEntity?
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            guard let view = self.view else { return }
            debugPrint("Anchors added to the scene: ", anchors)
            self.focusEntity = FocusEntity(on: view, style: .classic(color: .yellow))
        }
        
        @objc func handleTap() {
            guard let view = self.view, let focusEntity = self.focusEntity else { return }
            
            // Create a new anchor to add content to
            let anchor = AnchorEntity()
            view.scene.anchors.append(anchor)
            
            // Add a Box entity with a blue material
            let diceEntity = try! ModelEntity.loadModel(named: "Mahjong.usdz")
            
            var material = SimpleMaterial()
            material.baseColor = MaterialColorParameter.color(UIColor.white)
            diceEntity.model?.materials[0] = material
            
            diceEntity.scale = [0.001, 0.001, 0.001]
            diceEntity.position = focusEntity.position
            
            anchor.addChild(diceEntity)
        }
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
}

struct ARViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        ARViewContainer()
    }
}


