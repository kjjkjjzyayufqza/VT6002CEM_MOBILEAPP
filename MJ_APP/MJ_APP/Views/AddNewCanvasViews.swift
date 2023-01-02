//
//  AddNewCanvasViews.swift
//  MJ_APP
//
//  Created by admin on 3/1/2023.
//

import SwiftUI

struct AddNewCanvasViews: View {
    
    @Environment (\.managedObjectContext) var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State private var canvasTitle = ""
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Canvas Title", text : $canvasTitle)
                }
            }
            .navigationTitle(Text("Add New Canvas"))
            .toolbar{
                ToolbarItemGroup(placement: .automatic) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                    Button(action: {
                        if (!canvasTitle.isEmpty){
                            let drawing = Drawing(context: viewContext)
                            drawing.title = canvasTitle
                            drawing.id = UUID()
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }, label: {
                        Text("Save")
                    })
                }
                
            }
            
        }
    }
}

struct AddNewCanvasViews_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCanvasViews()
    }
}
