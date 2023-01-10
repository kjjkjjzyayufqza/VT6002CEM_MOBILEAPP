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
import PencilKit
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
            @FetchRequest(entity: Drawing.entity(), sortDescriptors: [], predicate: nil) var drawingData: FetchedResults<Drawing>
            
            guard let view = self.view, let focusEntity = self.focusEntity else { return }
            
            // Create a new anchor to add content to
            let anchor = AnchorEntity()
            view.scene.anchors.append(anchor)
            
            // Ccreate a Entity
            let MahjongEntity = makeEntity()
            
            // Set Entity position
            MahjongEntity.position = focusEntity.position
            
            anchor.addChild(MahjongEntity)
        }
    }
    
    static func makeEntity()-> ModelEntity{
        let MahjongEntity = try! ModelEntity.loadModel(named: "Mahjong.usdz")
        var material = SimpleMaterial()
        
        @Environment(\.managedObjectContext) var viewContext
        
        @FetchRequest(entity: TempImageData.entity(), sortDescriptors: [], predicate: nil) var tempImageData: FetchedResults<TempImageData>
        
        do{
            if(tempImageData.first?.front?.isEmpty != nil){
                
                let data:Data = (tempImageData.first?.front)!
                let temp = try PKDrawing(data: data)
                let image = temp.image(from: temp.bounds, scale: 1)
                
                //change to jpg and uiimage
                let jpgData = image.jpegData(compressionQuality: 1)!
                let toUIimage:UIImage? = UIImage(data: jpgData)!
                
                let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("temp.jpg")
                
                
                if ((try? jpgData.write(to: url)) != nil), // temporarily save the image data locally
                   let texture = try? TextureResource.load(contentsOf: url) {
                    var imageMaterial = UnlitMaterial()
                    imageMaterial.baseColor = MaterialColorParameter.texture(texture)
                    MahjongEntity.model?.materials[0] = imageMaterial
                }
                
            }
        }catch{
            
        }
        
        
        
        
        //0 is front, 1 is back,2 is right, 3 is left, 4 is top, 5 is bottom
        //        MahjongEntity.model?.materials[0] = material
        
        
        MahjongEntity.scale = [0.001, 0.001, 0.001]
        
        
        return MahjongEntity
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
}

