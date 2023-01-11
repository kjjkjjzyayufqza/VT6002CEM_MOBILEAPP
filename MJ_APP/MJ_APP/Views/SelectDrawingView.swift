//
//  DrawingView.swift
//  MJ_APP
//
//  Created by admin on 3/1/2023.
//

import SwiftUI
import CoreData
import PencilKit

struct SelectDrawingView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Drawing.entity(), sortDescriptors: []) var drawings: FetchedResults<Drawing>
    @State private var showEmptyAlert = false
    
    var onSelect: (_:UIImage) -> Void
    
    @State var showingAlert:Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                List {
                    ForEach(drawings){drawing in
                        HStack{
                            Text(drawing.title ?? "Untitled")
                            Spacer()
                            Button(action: {
                                do{
                                    print("doing now")
                                    if((drawing.canvasData?.isEmpty) != nil){
                                        //change to uiimage
                                        let data:Data = drawing.canvasData!
                                        let temp = try PKDrawing(data: data)
                                        let image = temp.image(from: temp.bounds, scale: 1)
                                        
                                        //change to jpg and uiimage
                                        let jpgData = image.jpegData(compressionQuality: 1)!
                                        let toUIimage:UIImage = UIImage(data: jpgData)!
                                        
                                        onSelect(toUIimage)
                                        print("Done")
                                        showingAlert = true
                                    }else{
                                        showEmptyAlert = true
                                        print("Fail")
                                    }
                                }catch let err{
                                    print("Error",err)
                                }
                            }, label: {
                                Image(systemName: "checkmark")
                            })
                            .frame(height: 20)
                            .padding(.all,10)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                            .buttonStyle(.plain)
                            .alert(isPresented: $showingAlert) {
                                        Alert(title: Text("Select Done"), message: Text("Please return to view"), dismissButton: .default(Text("OK")))
                                    }
                            
                        }
                    }
                    .alert("Empty drawings cannot be selected and saved", isPresented: $showEmptyAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    
                    Text("If you don't have a drawing please go to the drawing page to add one.")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}


struct SelectDrawingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDrawingView { image in
            print("hi")
        }
    }
}
