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
    @State private var showEmptyAlert = false
    
    var onSelect: (_:UIImage) -> Void
    
    var body: some View {
        NavigationView{
            VStack{

                List {
                    ForEach(drawings){drawing in
                        HStack{
                            NavigationLink(destination: DisplayDrawing(id: drawing.id, data: drawing.canvasData, title: drawing.title) ,label: {
                                HStack{
                                    Text(drawing.title ?? "Untitled")
                                    Spacer()

                                    
                                    Button(action: {
                                        do{
                                            if((drawing.canvasData?.isEmpty) != nil){
                                                let data:Data! = drawing.canvasData
                                                let temp = try PKDrawing(data: data)
                                                let image = temp.image(from: temp.bounds, scale: 1)
                                                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                                                showingAlert = true
                                            }else{
                                                showEmptyAlert = true
                                            }
                                        }catch{
                                            
                                        }
                                    }, label: {
                                        Image(systemName: "square.and.arrow.down")
                                    }).alert("Save to photo done", isPresented: $showingAlert) {
                                        Button("OK", role: .cancel) { }
                                    }
                                    .frame(height: 20)
                                    .padding(.all,10)
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .shadow(radius: 2)
                                    .buttonStyle(.plain)
                                    
                                    
                                }
                            })
                        }
                        
                    }
                    .onDelete(perform: deleteItem)
                    .alert("Empty drawings cannot be selected and saved", isPresented: $showEmptyAlert) {
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
                //                .scrollContentBackground(.hidden)
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
        DrawingView { image in
            print("hi")
        }
    }
}
