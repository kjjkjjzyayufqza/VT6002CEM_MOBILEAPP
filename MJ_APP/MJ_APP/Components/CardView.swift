//
//  CardView.swift
//  MJ_APP
//
//  Created by admin on 2/1/2023.
//

import SwiftUI

struct CardView: View {
    
    var title:String = ""
    var image:String = ""
    var content:String = ""
    var otherContent:String = ""
    var onClick: () -> Void = {}
    
    var body: some View {
        VStack {
            Button(action: {
                onClick()
            }, label: {
                VStack{
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    HStack {
                        VStack(alignment: .leading) {
                            Text(title)
                                .font(.headline)
                                .foregroundColor(.secondary)
                            Text(content)
                                .font(.title)
                                .fontWeight(.black)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.leading)

                            Text(otherContent.uppercased())
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .layoutPriority(100)
                        
                        Spacer()
                    }
                    .padding()
                }
            })

        }
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.3), lineWidth: 1)
        )
        .padding([.top, .horizontal])
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        .shadow(color: Color.black.opacity(0.1), radius: 20, x: 0, y: 10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "Test", image: "playing-mahjong", content: "Hello", otherContent: "2022/12/22",onClick: {
            print("hi")
        })
    }
}
