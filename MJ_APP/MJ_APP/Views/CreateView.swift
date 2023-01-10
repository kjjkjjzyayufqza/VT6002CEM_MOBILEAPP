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
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack{
                    
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
                }
                
                
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
                            //Top---------------------------
                            if let image:UIImage? = imageData.Top,
                               let rota = image?.rotated(by: Measurement(value: 180, unit: .degrees), options: [.flipOnVerticalAxis]),
                               let data = rota.jpegData(compressionQuality: 1){
                                let filename = getDocumentsDirectory().appendingPathComponent("TOP.jpg")
                                try? data.write(to: filename)
                            }else{
                                if let image = UIImage(named: "TOP"),
                                   let rota:UIImage? = image.rotated(by: Measurement(value: 180, unit: .degrees), options: [.flipOnVerticalAxis]),
                                   let data = rota?.jpegData(compressionQuality: 1){
                                    let filename = getDocumentsDirectory().appendingPathComponent("TOP.jpg")
                                    try? data.write(to: filename)
                                }
                            }
                            
                            //Bottom---------------------------
                            if let image:UIImage? = imageData.Bottom,
                               let rota = image?.rotated(by: Measurement(value: 180, unit: .degrees), options: [.flipOnVerticalAxis]),
                               let data = rota.jpegData(compressionQuality: 1){
                                let filename = getDocumentsDirectory().appendingPathComponent("BOTTOM.jpg")
                                try? data.write(to: filename)
                            }else{
                                if let image = UIImage(named: "BOTTOM"),
                                   let rota:UIImage? = image.rotated(by: Measurement(value: 180, unit: .degrees), options: [.flipOnVerticalAxis]),
                                   let data = rota?.jpegData(compressionQuality: 1){
                                    let filename = getDocumentsDirectory().appendingPathComponent("BOTTOM.jpg")
                                    try? data.write(to: filename)
                                }
                            }
                            
                            //Front--------------------------
                            if let image:UIImage? = imageData.Front,
                               let rota = image?.rotated(by: Measurement(value: 180, unit: .degrees), options: [.flipOnVerticalAxis]),
                               let data = rota.jpegData(compressionQuality: 1){
                                let filename = getDocumentsDirectory().appendingPathComponent("FRONT.jpg")
                                try? data.write(to: filename)
                            }else{
                                if let image = UIImage(named: "FRONT"),
                                   let rota:UIImage? = image.rotated(by: Measurement(value: 180, unit: .degrees), options: [.flipOnVerticalAxis]),
                                   let data = rota?.jpegData(compressionQuality: 1){
                                    let filename = getDocumentsDirectory().appendingPathComponent("FRONT.jpg")
                                    try? data.write(to: filename)
                                }
                            }
                            
                            
                            //Back--------------------------
                            if let image:UIImage? = imageData.Back,
                               let rota = image?.rotated(by: Measurement(value: 180, unit: .degrees), options: [.flipOnVerticalAxis]),
                               let data = rota.jpegData(compressionQuality: 1){
                                let filename = getDocumentsDirectory().appendingPathComponent("BACK.jpg")
                                try? data.write(to: filename)
                            }else{
                                if let image = UIImage(named: "BACK"),
                                   let rota:UIImage? = image.rotated(by: Measurement(value: 180, unit: .degrees), options: [.flipOnVerticalAxis]),
                                   let data = rota?.jpegData(compressionQuality: 1){
                                    let filename = getDocumentsDirectory().appendingPathComponent("BACK.jpg")
                                    try? data.write(to: filename)
                                }
                            }
                            
                            //Left--------------------------
                            if let image:UIImage? = imageData.Left,
                               let rota = image?.rotated(by: Measurement(value: 180, unit: .degrees), options: [.flipOnVerticalAxis]),
                               let data = rota.jpegData(compressionQuality: 1){
                                let filename = getDocumentsDirectory().appendingPathComponent("LEFT.jpg")
                                try? data.write(to: filename)
                            }else{
                                if let image = UIImage(named: "LEFT"),
                                   let rota:UIImage? = image.rotated(by: Measurement(value: 180, unit: .degrees), options: [.flipOnVerticalAxis]),
                                   let data = rota?.jpegData(compressionQuality: 1){
                                    let filename = getDocumentsDirectory().appendingPathComponent("LEFT.jpg")
                                    try? data.write(to: filename)
                                }
                            }
                            
                            //Right--------------------------
                            if let image:UIImage? = imageData.Right,
                               let rota = image?.rotated(by: Measurement(value: 180, unit: .degrees), options: [.flipOnVerticalAxis]),
                               let data = rota.jpegData(compressionQuality: 1){
                                let filename = getDocumentsDirectory().appendingPathComponent("RIGHT.jpg")
                                try? data.write(to: filename)
                            }else{
                                if let image = UIImage(named: "RIGHT"),
                                   let rota:UIImage? = image.rotated(by: Measurement(value: 180, unit: .degrees), options: [.flipOnVerticalAxis]),
                                   let data = rota?.jpegData(compressionQuality: 1){
                                    let filename = getDocumentsDirectory().appendingPathComponent("RIGHT.jpg")
                                    try? data.write(to: filename)
                                }
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
                    
                    Button(action: {
                        imageData.Top = UIImage(named: "E_TOP") ?? UIImage()
                        imageData.Bottom = UIImage(named: "E_BOTTOM") ?? UIImage()
                        imageData.Front = UIImage(named: "E_FRONT") ?? UIImage()
                        imageData.Back = UIImage(named: "E_BACK") ?? UIImage()
                        imageData.Left = UIImage(named: "E_LEFT") ?? UIImage()
                        imageData.Right = UIImage(named: "E_RIGHT") ?? UIImage()
                    }, label: {
                        Text("Default")
                    })
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(Color.blue,lineWidth: 2.0)
                    )
                }
                VStack{
                    Text("Please complete the six face of the setup")
                    Text("You can also load defalut images by clicking on defalut")
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
    func loadImageFromDiskWith(fileName: String) -> UIImage? {
        
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image
            
        }
        
        return nil
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
    struct RotationOptions: OptionSet {
        let rawValue: Int
        
        static let flipOnVerticalAxis = RotationOptions(rawValue: 1)
        static let flipOnHorizontalAxis = RotationOptions(rawValue: 2)
    }
    
    func rotated(by rotationAngle: Measurement<UnitAngle>, options: RotationOptions = []) -> UIImage? {
        guard let cgImage = self.cgImage else { return nil }
        
        let rotationInRadians = CGFloat(rotationAngle.converted(to: .radians).value)
        let transform = CGAffineTransform(rotationAngle: rotationInRadians)
        var rect = CGRect(origin: .zero, size: self.size).applying(transform)
        rect.origin = .zero
        
        let renderer = UIGraphicsImageRenderer(size: rect.size)
        return renderer.image { renderContext in
            renderContext.cgContext.translateBy(x: rect.midX, y: rect.midY)
            renderContext.cgContext.rotate(by: rotationInRadians)
            
            let x = options.contains(.flipOnVerticalAxis) ? -1.0 : 1.0
            let y = options.contains(.flipOnHorizontalAxis) ? 1.0 : -1.0
            renderContext.cgContext.scaleBy(x: CGFloat(x), y: CGFloat(y))
            
            let drawRect = CGRect(origin: CGPoint(x: -self.size.width/2, y: -self.size.height/2), size: self.size)
            renderContext.cgContext.draw(cgImage, in: drawRect)
        }
    }
}

