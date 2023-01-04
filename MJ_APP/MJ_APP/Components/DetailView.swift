//
//  DetailView.swift
//  MJ_APP
//
//  Created by admin on 4/1/2023.
//

import SwiftUI

struct DetailView: View {
    var title:String = "z"
    var contents:String = "z"
    var image:String = "z"
    var childrenText: Text = Text("hi")
    var body: some View {
        ScrollView{
            VStack{
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text(title)
                .font(.title)
            Text(contents)
                .font(.body)
            childrenText
        }.padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
