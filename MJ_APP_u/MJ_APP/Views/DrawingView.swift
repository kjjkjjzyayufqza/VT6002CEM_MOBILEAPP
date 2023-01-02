//
//  DrawingView.swift
//  MJ_APP
//
//  Created by admin on 3/1/2023.
//

import SwiftUI
import PencilKit
struct DrawingView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Drawing.entity(), sortDescriptors: []) var drawing: FetchedResults<Drawing>
    
    @State private var showSheet = false
    
    var body: some View {
        NavigationView{
            VStack{
                List {
                    ForEach(drawing){ drawing in
                        Text(drawing.title ?? "Untitled")
                    }
                }
                .toolbar{
                    
                }
                
                Button(action: {
                    self.showSheet.toggle()
                }, label: {
                    HStack{
                        Image(systemName: "plus")
                        Text("Add Canvas")
                    }
                })
                .sheet(isPresented: $showSheet, content: {
                    AddNewCanvasViews().environment(\.managedObjectContext, viewContext)
                })
            }
            VStack{
                Image(systemName: "scribble.variable")
                    .font(.largeTitle)
                Text("No canvas has been selected")
                    .font(.title)
            }

    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView().environment(\.managedObjectContext, UIViewController)
    }
}
