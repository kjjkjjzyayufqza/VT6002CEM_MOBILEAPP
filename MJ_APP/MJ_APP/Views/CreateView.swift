//
//  CreateView.swift
//  MJ_APP
//
//  Created by admin on 5/1/2023.
//

import SwiftUI

enum ActiveSheet: Identifiable {
    case first, second
    
    var id: Int {
        hashValue
    }
}

struct CreateView: View {
    
    @State var imageData:selectType = selectType()
    
    @State var toDrawing: Bool = false
    @State var toSelectPhoto: Bool = false
    
    @State var activeSheet: ActiveSheet?
    
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Button(action: {
                        activeSheet = .first
                    }, label: {
                        VStack{
                            if(imageData.Top.size != .zero){
                                Image(uiImage: imageData.Top)
                                    .resizable()
                            }else{
                                Image(systemName: "plus.app")
                                    .resizable()
                                    .frame(width: 32.0, height: 32.0)
                            }
                            
                        }.frame(width: 80, height: 80, alignment: .center)
                    })
                    .foregroundColor(Color.black)
                    .background(Color(hex: "F0EFF5"))
                    Text("Top")
                }
            }
            HStack{
                VStack{
                    Button(action: {
                        activeSheet = .second
                    }, label: {
                        VStack{
                            if(imageData.Front.size != .zero){
                                Image(uiImage: imageData.Front)
                                    .resizable()
                            }else{
                                Image(systemName: "plus.app")
                                    .resizable()
                                    .frame(width: 32.0, height: 32.0)
                            }
                            
                        }.frame(width: 80, height: 120, alignment: .center)
                    })
                    .foregroundColor(Color.black)
                    .background(Color(hex: "F0EFF5"))
                    Text("Front")
                }
                
                VStack{
                    Button(action: {}, label: {
                        VStack{
                            Image(systemName: "plus.app")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                        }.frame(width: 80, height: 120, alignment: .center)
                    })
                    .foregroundColor(Color.black)
                    .background(Color(hex: "F0EFF5"))
                    Text("Back")
                }
                
                VStack{
                    Button(action: {}, label: {
                        VStack{
                            Image(systemName: "plus.app")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                        }.frame(width: 80, height: 120, alignment: .center)
                    })
                    .foregroundColor(Color.black)
                    .background(Color(hex: "F0EFF5"))
                    Text("Left")
                }
                
                VStack{
                    Button(action: {}, label: {
                        VStack{
                            Image(systemName: "plus.app")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                        }.frame(width: 80, height: 120, alignment: .center)
                    })
                    .foregroundColor(Color.black)
                    .background(Color(hex: "F0EFF5"))
                    Text("Right")
                }
            }
            HStack{
                VStack{
                    Button(action: {

                        print(imageData)
                    }, label: {
                        VStack{
                            if(imageData.Bottom.size != .zero){
                                Image(uiImage: imageData.Bottom)
                                    .resizable()
                            }else{
                                Image(systemName: "plus.app")
                                    .resizable()
                                    .frame(width: 32.0, height: 32.0)
                            }
                            
                        }.frame(width: 80, height: 120, alignment: .center)
                    })
                    .foregroundColor(Color.black)
                    .background(Color(hex: "F0EFF5"))
                    Text("Bottom")
                }
            }
            HStack{
                Button(action: {
                    imageData = selectType(Front: UIImage(), Back: UIImage(), Left: UIImage(), Right: UIImage(), Top: UIImage(), Bottom: UIImage())
                }, label: {
                    Text("Clear")
                })
            }
        }
        .sheet(item: $activeSheet) { item in
            switch item {
            case .first:
                sheetView_CreateView(imageData: $imageData.Top, toDrawing: $toDrawing, toSelectPhoto: $toSelectPhoto)
            case .second:
                sheetView_CreateView(imageData: $imageData.Front, toDrawing: $toDrawing, toSelectPhoto: $toSelectPhoto)
            }
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}

struct selectType{
    var Front:UIImage = UIImage()
    var Back:UIImage = UIImage()
    var Left:UIImage = UIImage()
    var Right:UIImage = UIImage()
    var Top:UIImage = UIImage()
    var Bottom:UIImage = UIImage()
}

struct sheetView_CreateView:View{
    @Binding var imageData: UIImage
    @Binding var toDrawing: Bool
    @Binding var toSelectPhoto: Bool
    
    var body: some View{
        NavigationStack {
            HStack(spacing: 0) {
                VStack {
                    Button(action: {
                        toDrawing = true
                    }, label: {
                        Text("Drawing")
                            .font(.body)
                            .padding()
                    })
                    .buttonStyle(.borderedProminent)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
                
                VStack {
                    Button(action: {
                        toSelectPhoto = true
                    }, label: {
                        Text("Photo")
                            .font(.body)
                            .padding()
                    })
                    .buttonStyle(.borderedProminent)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .navigationTitle("Select image")
            .navigationDestination(isPresented: $toDrawing) {
                DrawingView()
            }
            .navigationDestination(isPresented: $toSelectPhoto) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$imageData)
            }
        }
    }
}
