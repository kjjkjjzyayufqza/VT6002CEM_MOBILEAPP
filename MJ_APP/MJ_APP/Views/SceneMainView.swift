//
//  3DMainView.swift
//  MJ_APP
//
//  Created by admin on 8/1/2023.
//

import SwiftUI
import CoreData

struct SceneMainView: View {
    var isShowGoARView:Bool? = true
    var isShowTitle:Bool? = true
    var imageData:SixFcaeType? = SixFcaeType()

    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(entity: TempImageData.entity(), sortDescriptors: [], predicate: nil) var tempImageData: FetchedResults<TempImageData>
    
    
    var body: some View {
        NavigationStack{
            VStack{
                if isShowTitle! {
                    Text("Preview Mahjong model")
                        .font(.title)
                        .frame(height: 80)
                }

                SceneView(imageData: imageData)
                
                if isShowGoARView! {
                    Button(action: {

                    }, label: {
                        NavigationLink(destination: {
                            ARViewContainer()
                        }, label: {
                            Text("To AR View")
                        })
                        .simultaneousGesture(TapGesture().onEnded{
                            print(tempImageData.first)
                        })
                    })
                    .font(.title2)
                    .padding()
                    .accentColor(.white)
                    .background(Color(hex: "007EFB"))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
            }

        }

    }
}

struct SceneMainView_Previews: PreviewProvider {
    static var previews: some View {
        SceneMainView()
    }
}
