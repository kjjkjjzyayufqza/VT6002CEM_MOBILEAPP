//
//  LoginVie.swift
//  MJ_APP
//
//  Created by admin on 9/1/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State var isClickLogin = false
    @State var email:String = ""
    @State var password:String = ""
    
    @State var isActive_register = false
    @State var isActive_main = false
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack{
                    Color(hex: "FFFFFF").edgesIgnoringSafeArea(.all)
                    VStack{
                        Spacer()
                        Text("AR-Mahjong")
                            .font(.title)
                            .fontWeight(.bold)
                        Image("loginPageIcon")
                            .resizable()
                            .frame(width: 200, height: 200)
                        
                        Spacer()
                        
                        largeBtn(title: "Sign in", backgroudColor: "007EFB", textColor: "FFFFFF", onClick: {
                            isClickLogin = true
                            isActive_main = true
                        })
                        
                        
                        largeBtn(title: "Guest", backgroudColor: "FFFFFF", textColor: "000000", onClick: {
                            isActive_register = true
                        })

                        
                        VStack{
                            SecureField("Email",text: $email)
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
                            largeBtn(title: "Login", backgroudColor: "007EFB", textColor: "FFFFFF", onClick: {
                                
                            })


                        }
                        
                        HStack{
                            Text("Not Account?")
                            Text("Register")
                                .foregroundColor(Color(hex: "007EFB"))
                                .onTapGesture {
                                    
                                }
                        }
                        FooterView()
                    }
                    .padding()

                }
            }
            .navigationDestination(isPresented: $isActive_main) {
                MainView().navigationBarBackButtonHidden(true)
            }
            .navigationDestination(isPresented: $isActive_register) {
                RegisterView()
            }
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
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        })
        .padding(.vertical,10)
    }
}


