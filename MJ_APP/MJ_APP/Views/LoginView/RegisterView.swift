//
//  RegisterView.swift
//  MJ_APP
//
//  Created by admin on 9/1/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @State var email:String = ""
    @State var password:String = ""
    @State var rePassword:String = ""
    
    var body: some View {
        ZStack{
            Color(hex: "FFFFFF").edgesIgnoringSafeArea(.all)
            VStack{

                Text("Register Account")
                    .font(.title)
                    .fontWeight(.bold)

                TextField("Email",text: $email)
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(50)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    
                
                SecureField("Password",text: $password)
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(50)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    .padding(.vertical)
                
                SecureField("Re Password",text: $rePassword)
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(50)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                
                largeBtn(title: "Register", backgroudColor: "007EFB", textColor: "FFFFFF", onClick: {
                    
                })
            }
            .padding()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
