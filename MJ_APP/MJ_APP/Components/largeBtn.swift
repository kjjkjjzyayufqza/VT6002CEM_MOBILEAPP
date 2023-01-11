//
//  largeBtn.swift
//  MJ_APP
//
//  Created by admin on 10/1/2023.
//

import SwiftUI

struct largeBtn:View{
    var title:String
    var backgroudColor:String
    var textColor:String
    var onClick: () -> Void

    var body: some View{
        Button(action: {
            onClick()
        }, label: {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: textColor))
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(hex: backgroudColor))
                .cornerRadius(50)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        })
        .padding(.vertical,10)
    }
}


struct largeBtn_Previews: PreviewProvider {
    static var previews: some View {
        largeBtn(title: "Login", backgroudColor: "007EFB", textColor: "FFFFFF", onClick: {
            
        })
    }
}
