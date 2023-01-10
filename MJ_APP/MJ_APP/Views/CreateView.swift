//
//  CreateView.swift
//  MJ_APP
//
//  Created by admin on 5/1/2023.
//

import SwiftUI

enum ActiveSheet: Identifiable {
    case Top,Bottom,Front,Back,Left,Right
    
    var id: Int {
        hashValue
    }
}

struct CreateView: View {
    
    @State var imageData:SixFcaeType = SixFcaeType()
    
    @State var activeSheet: ActiveSheet?
    
    @State var isShowPreview:Bool = false
    
    @State var nextTo3DPageView:Bool = false
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(entity: TempImageData.entity(), sortDescriptors: [], predicate: nil) var tempImageData: FetchedResults<TempImageData>
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack{
                    Button(action: {
                        isShowPreview = true
                    }, label: {
                        Image(systemName: "view.3d")
                            .font(.title2)
                            .padding()
                            .accentColor(.white)
                            .background(Color(hex: "007EFB"))
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        
                    })
                    .padding(.trailing,10)
                    .sheet(isPresented: $isShowPreview, content: {
                        SceneMainView(isShowGoARView: false, imageData: imageData)
                    })
                    
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                
                HStack{
                    VStack{
                        Button(action: {
                            activeSheet = .Top
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
                            activeSheet = .Front
                            
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
                        Button(action: {
                            activeSheet = .Back
                            
                        }, label: {
                            VStack{
                                if(imageData.Back.size != .zero){
                                    Image(uiImage: imageData.Back)
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
                        Text("Back")
                    }
                    
                    VStack{
                        Button(action: {
                            activeSheet = .Left
                            
                        }, label: {
                            VStack{
                                if(imageData.Left.size != .zero){
                                    Image(uiImage: imageData.Left)
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
                        Text("Left")
                    }
                    
                    VStack{
                        Button(action: {
                            activeSheet = .Right
                            
                        }, label: {
                            VStack{
                                if(imageData.Right.size != .zero){
                                    Image(uiImage: imageData.Right)
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
                        Text("Right")
                    }
                }
                HStack{
                    VStack{
                        Button(action: {
                            activeSheet = .Bottom
                            
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
                        
                    }, label: {
                        NavigationLink(destination: {
                            SceneMainView(isShowGoARView: true,imageData: imageData)
                        }, label: {
                            Text("Next")
                        }).simultaneousGesture(TapGesture().onEnded{
                            let tempFront = TempImageData(context: self.viewContext)
                            tempFront.front = imageData.Front.jpegData(compressionQuality: 1)
                            do {
                                try self.viewContext.save()
                                print("save done")
                            } catch {
                                
                            }
                        })
                    })
                    .padding()
                    .accentColor(.white)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    
                    Button(action: {
                        imageData = SixFcaeType(Front: UIImage(), Back: UIImage(), Left: UIImage(), Right: UIImage(), Top: UIImage(), Bottom: UIImage())
                    }, label: {
                        Text("Clear")
                    })
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(Color.blue,lineWidth: 2.0)
                    )
                }
                VStack{
                    Text("Please complete the six face of the setup")
                }
                .navigationTitle("Create")
            }
            .sheet(item: $activeSheet) { item in
                switch item {
                case .Top:
                    sheetView_CreateView(imageData: $imageData.Top)
                case .Bottom:
                    sheetView_CreateView(imageData: $imageData.Bottom)
                case .Front:
                    sheetView_CreateView(imageData: $imageData.Front)
                case .Back:
                    sheetView_CreateView(imageData: $imageData.Back)
                case .Left:
                    sheetView_CreateView(imageData: $imageData.Left)
                case .Right:
                    sheetView_CreateView(imageData: $imageData.Right)
                    
                }
            }
            
            
        }
        
    }

}



struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}

struct SixFcaeType{
    var Front:UIImage = UIImage()
    var Back:UIImage = UIImage()
    var Left:UIImage = UIImage()
    var Right:UIImage = UIImage()
    var Top:UIImage = UIImage()
    var Bottom:UIImage = UIImage()
}

struct sheetView_CreateView:View{
    @Binding var imageData: UIImage
    
    var body: some View{
        NavigationStack {
            HStack(spacing: 0) {
                VStack {
                    
                    Button(action: {
                        
                    }, label: {
                        NavigationLink(destination: {
                            SelectDrawingView { UIImage in
                                imageData = UIImage
                                print(UIImage)
                            }
                        }, label: {
                            Text("Drawing")
                                .foregroundColor(.white)
                                .font(.body)
                                .padding()
                        })
                        
                    })
                    .buttonStyle(.borderedProminent)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
                
                VStack {
                    Button(action: {
                        
                    }, label: {
                        NavigationLink(destination: {
                            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$imageData)
                        }, label: {
                            Text("Photo")
                                .foregroundColor(.white)
                                .font(.body)
                                .padding()
                        })
                        
                    })
                    .buttonStyle(.borderedProminent)
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .navigationTitle("Select image")
        }
    }
}

extension UIImage {
    
    /// Rotate the UIImage
    /// - Parameter orientation: Define the rotation orientation
    /// - Returns: Get the rotated image
    func rotateImage(orientation: UIImage.Orientation) -> UIImage {
        guard let cgImage = self.cgImage else { return UIImage() }
        switch orientation {
        case .right:
            return UIImage(cgImage: cgImage, scale: 1.0, orientation: .up)
        case .down:
            return UIImage(cgImage: cgImage, scale: 1.0, orientation: .right)
        case .left:
            return UIImage(cgImage: cgImage, scale: 1.0, orientation: .down)
        default:
            return UIImage(cgImage: cgImage, scale: 1.0, orientation: .left)
        }
    }
}
