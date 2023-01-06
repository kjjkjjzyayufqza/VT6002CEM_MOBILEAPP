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
    
    func makeUIView(context: Context) -> some UIView {
        
//        let node = scene?.rootNode.childNode(withName: "Tomato", recursively: true)
//        node?.childNodes[0].childNodes[0].geometry?.firstMaterial?.diffuse.contents = UIColor.green
//        print(node?.childNodes[0])
        
        let view = SCNView()
        view.allowsCameraControl = true
        view.autoenablesDefaultLighting = true
        view.antialiasingMode = .multisampling2X
        view.scene = scene
        view.backgroundColor = .clear
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
