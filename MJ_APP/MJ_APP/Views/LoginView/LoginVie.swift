//
//  LoginVie.swift
//  MJ_APP
//
//  Created by admin on 9/1/2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            VStack{
                Image("loginPageIcon")
                    .resizable()
                    .frame(width: 200, height: 300)
                largeBtn(title: "Login", backgroudColor: "007EFB", textColor: "FFFFFF", onClick: {
                    
                })
                
                largeBtn(title: "Guest", backgroudColor: "007EFB", textColor: "FFFFFF", onClick: {
                    
                })
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

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
        })
    }
}
