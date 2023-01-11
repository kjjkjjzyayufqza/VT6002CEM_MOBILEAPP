//
//  SceneView.swift
//  MJ_APP
//
//  Created by admin on 5/1/2023.
//

import SwiftUI
import SceneKit

struct SceneView: UIViewRepresentable {
    
    var scene:SCNScene? = .init(named: "Mahjong.usdz")
    
    var imageData:SixFcaeType? = SixFcaeType()
    
    func makeUIView(context: Context) -> some UIView {

        let view = SCNView()
        view.allowsCameraControl = true
        view.autoenablesDefaultLighting = true
        view.antialiasingMode = .multisampling2X
        view.scene = scene
        view.backgroundColor = .gray
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        
        view.scene?.rootNode.addChildNode(cameraNode)
        view.pointOfView = cameraNode

        cameraNode.position = SCNVector3(0,15,60)
        
        
        let node = scene?.rootNode.childNode(withName: "RootNode", recursively: true)
        node?.eulerAngles.y = 0.7
        
        if(imageData?.Top.size != .zero){
            
            let translation = SCNMatrix4MakeTranslation(0, 0, 0)
            let rotation = SCNMatrix4MakeRotation(Float.pi / 1, 1, 0, 0)
            let transform = SCNMatrix4Mult(translation, rotation)

            let frontNode = scene?.rootNode.childNode(withName: "TOP", recursively: true)
            frontNode?.childNodes[0].childNodes[0].geometry?.materials[0].diffuse.contents = imageData?.Top
            
            frontNode?.childNodes[0].childNodes[0].geometry?.materials[0].diffuse.contentsTransform = transform
        }
        
        if(imageData?.Bottom.size != .zero){
            
            let translation = SCNMatrix4MakeTranslation(0, 0, 0)
            let rotation = SCNMatrix4MakeRotation(Float.pi / 1, 1, 0, 0)
            let transform = SCNMatrix4Mult(translation, rotation)

            let frontNode = scene?.rootNode.childNode(withName: "BOTTOM", recursively: true)
            frontNode?.childNodes[0].childNodes[0].geometry?.materials[0].diffuse.contents = imageData?.Bottom
            
            frontNode?.childNodes[0].childNodes[0].geometry?.materials[0].diffuse.contentsTransform = transform
        }
        
        if(imageData?.Front.size != .zero){
            
            let translation = SCNMatrix4MakeTranslation(0, 0, 0)
            let rotation = SCNMatrix4MakeRotation(Float.pi / 1, 1, 0, 0)
            let transform = SCNMatrix4Mult(translation, rotation)

            let frontNode = scene?.rootNode.childNode(withName: "FRONT", recursively: true)
            frontNode?.childNodes[0].childNodes[0].geometry?.materials[0].diffuse.contents = imageData?.Front
            
            frontNode?.childNodes[0].childNodes[0].geometry?.materials[0].diffuse.contentsTransform = transform
        }
        
        if(imageData?.Back.size != .zero){
            
            let translation = SCNMatrix4MakeTranslation(0, 0, 0)
            let rotation = SCNMatrix4MakeRotation(Float.pi / 1, 1, 0, 0)
            let transform = SCNMatrix4Mult(translation, rotation)

            let frontNode = scene?.rootNode.childNode(withName: "BACK", recursively: true)
            frontNode?.childNodes[0].childNodes[0].geometry?.materials[0].diffuse.contents = imageData?.Back
            
            frontNode?.childNodes[0].childNodes[0].geometry?.materials[0].diffuse.contentsTransform = transform
        }
        
        if(imageData?.Left.size != .zero){
            
            let translation = SCNMatrix4MakeTranslation(0, 0, 0)
            let rotation = SCNMatrix4MakeRotation(Float.pi / 1, 1, 0, 0)
            let transform = SCNMatrix4Mult(translation, rotation)

            let frontNode = scene?.rootNode.childNode(withName: "LEFT", recursively: true)
            frontNode?.childNodes[0].childNodes[0].geometry?.materials[0].diffuse.contents = imageData?.Left
            
            frontNode?.childNodes[0].childNodes[0].geometry?.materials[0].diffuse.contentsTransform = transform
        }
        
        if(imageData?.Right.size != .zero){
            
            let translation = SCNMatrix4MakeTranslation(0, 0, 0)
            let rotation = SCNMatrix4MakeRotation(Float.pi / 1, 1, 0, 0)
            let transform = SCNMatrix4Mult(translation, rotation)

            let frontNode = scene?.rootNode.childNode(withName: "RIGHT", recursively: true)
            frontNode?.childNodes[0].childNodes[0].geometry?.materials[0].diffuse.contents = imageData?.Right
            
            frontNode?.childNodes[0].childNodes[0].geometry?.materials[0].diffuse.contentsTransform = transform
        }
        
        return view
    }
    
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct SceneView_Previews: PreviewProvider {
    @State var scene:SCNScene? = .init(named: "Tomato.usdz")
    static var previews: some View {
        SceneView()
    }
}
