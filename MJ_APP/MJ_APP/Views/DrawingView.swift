//
//  DrawingView.swift
//  MJ_APP
//
//  Created by admin on 3/1/2023.
//

import SwiftUI
import CoreData
import PencilKit

struct DrawingView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Drawing.entity(), sortDescriptors: []) var drawings: FetchedResults<Drawing>
    
    @State var showingAlert = false
    
    @State private var showSheet = false
    var body: some View {
        NavigationView{
            VStack{
                List {
                    ForEach(drawings){drawing in
                        NavigationLink(destination: DisplayDrawing(id: drawing.id, data: drawing.canvasData, title: drawing.title) ,label: {
                            Text(drawing.title ?? "Untitled")
                        })
                    }
                    .onDelete(perform: deleteItem)
                    Button(action: {
                        do{
//                            let data:Data! = drawings[0].canvasData
//                            let a = try PKDrawing(data: data)
//                            let image = a.image(from: CGRect(x: 0, y: 0, width: 1000, height: 1000), scale: 1)
//                            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                            showingAlert = true
                        }catch{
                            
                        }

                    }, label: {
                        Text("T")
                    }).alert("Save to photo", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    Button(action: {
                        self.showSheet.toggle()
                    }, label: {
                        HStack{
                            Image(systemName: "plus")
                            Text("Add Canvas")
                        }
                    })
                    .foregroundColor(.blue)
                    .sheet(isPresented: $showSheet, content: {
                        AddNewCanvasViews().environment(\.managedObjectContext, viewContext)
                    })
                }
                .navigationTitle(Text("Drawing"))
                .toolbar {
                    EditButton()
                }
                .scrollContentBackground(.hidden)
            }
            VStack{
                Image(systemName: "scribble.variable")
                    .font(.largeTitle)
                Text("No canvas has been selected")
                    .font(.title)
            }
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        
    }
    
    func deleteItem(at offset: IndexSet) {
        for index in offset{
            let itemToDelete = drawings[index]
            viewContext.delete(itemToDelete)
            do{
                try viewContext.save()
            }
            catch{
                print(error)
            }
        }
    }
    
}


struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
