//
//  CreateView.swift
//  MJ_APP
//
//  Created by admin on 5/1/2023.
//

import SwiftUI

struct CreateView: View {
    
    @State var imageData:selectType = selectType(Front: UIImage(), Back: UIImage(), Left: UIImage(), Right: UIImage(), Top: UIImage(), Bottom: UIImage())
    
    @State private var isShowPhotoLibrary = false

    var body: some View {
        VStack{
            HStack{
                VStack{
                    Button(action: {
                        isShowPhotoLibrary = true
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

                        }.frame(width: 80, height: 80, alignment: .center)
                    })
                    .foregroundColor(Color.black)
                    .background(Color(hex: "F0EFF5"))
                    .sheet(isPresented: $isShowPhotoLibrary) {
                        ImagePicker(sourceType: .photoLibrary, selectedImage: self.$imageData.Front)
                    }
                    Text("Top")
                }
            }
            HStack{
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
                    Button(action: {}, label: {
                        VStack{
                            Image(systemName: "plus.app")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                        }.frame(width: 80, height: 80, alignment: .center)
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
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}

struct selectType{
    var Front:UIImage
    var Back:UIImage
    var Left:UIImage
    var Right:UIImage
    var Top:UIImage
    var Bottom:UIImage
}
