//
//  CardView.swift
//  MJ_APP
//
//  Created by admin on 2/1/2023.
//

import SwiftUI

struct CardView: View {
    
    var title:String?
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("SwiftUI")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text("Hello, today is a good day! What do you thingk?")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text("Written by Author".uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.3), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
