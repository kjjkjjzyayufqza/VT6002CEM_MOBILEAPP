//
//  MapPinCard.swift
//  MJ_APP
//
//  Created by admin on 6/1/2023.
//

import SwiftUI

struct MapPinCardView: View {
    
    var name:String = "Biu Kee Mahjong"
    var image:String = "BiuKeeMahjong"
    
    var body: some View {
        NavigationStack{
            ZStack{
                Button(action: {}, label: {
                    NavigationLink(destination: {
                        if(name == "Biu Kee Mahjong"){
                            DetailView(title: "Biu Kee Mahjong/標記蔴雀",
                                       contents: "Location : G/F., 26F, Jordan Rd",
                                       image: "BiuKeeMahjong")
                        }else{
                            DetailView(title: "Golden Sparrow/金發麻雀",
                                       contents: "Location : 2 Bulkeley Street, Hung Hom",
                                       image: "GoldenSparrow")
                        }
                    }, label: {
                        ZStack{
                            HStack{
                                Image(image)
                                    .resizable()
                                    .scaledToFit()
                                Text(name)
                                    .padding(.trailing,10)
                                Image(systemName: "arrowshape.turn.up.forward")
                                    .padding(.trailing)
                                
                            }
                            .frame(height: 50)
                            .background(.white)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                            .padding(10)
                            Triangle()
                                .fill(.white)
                                .frame(width: 40, height: 30)
                                .rotationEffect(Angle(degrees: 180))
                                .padding(.top,70)
                        }
                    })
                    
                })
                
            }
            .padding(.bottom,30)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
            
        }

    }
}

struct MapPinCardView_Previews: PreviewProvider {
    static var previews: some View {
        MapPinCardView()
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}
