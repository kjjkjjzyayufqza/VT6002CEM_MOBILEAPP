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
    var network = Network()
    @State private var showingAlert = false
    
    @State var alertTitle:String = ""
    @State var alertContent:String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack{
            Color(hex: "FFFFFF").edgesIgnoringSafeArea(.all)
            VStack{

                Text("Register Account")
                    .font(.title)
                    .fontWeight(.bold)

                TextField("Email / User Name",text: $email)
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(50)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    
                
                SecureField("Password(Length > 6)",text: $password)
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

                    if(!email.isEmpty){
                        if(password == rePassword){
                            if(password.count > 5){
                                Task{
                                    await network.createUsers(email:email,password:password)
                                    showingAlert = true
                                    alertTitle = "Reigster Sucess"
                                    alertContent = "Please Login"
                                    self.presentationMode.wrappedValue.dismiss()
                                }

                            }else{
                                showingAlert = true
                                alertTitle = "Password length must be greater than 6"
                                alertContent = "Please RE input"
                            }
                        }else{
                            showingAlert = true
                            alertTitle = "Two different passwords !"
                            alertContent = "Please RE input"
                        }
                    }else{
                        showingAlert = true
                        alertTitle = "Please enter all fields !"
                        alertContent = ""
                    }

                })
                .alert(isPresented: $showingAlert) {
                            Alert(title: Text(alertTitle), message: Text(alertContent), dismissButton: .default(Text("OK")))
                        }
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
