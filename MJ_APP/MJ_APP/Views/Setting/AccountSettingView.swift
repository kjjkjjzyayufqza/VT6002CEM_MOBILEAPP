//
//  AccountSettingView.swift
//  MJ_APP
//
//  Created by admin on 10/1/2023.
//

import SwiftUI

struct AccountSettingView: View {
    @State var email:String = ""
    @State var password:String = ""
    var body: some View {
        NavigationStack{
            Form{
                Section(content: {
                    TextField("Email", text: $email)
                        .disabled(true)
                        
                    TextField("Password", text: $password)
                        
                       
                }, header: {
                    Text("User information")
                },footer: {
                    Text("You can update your password here")
                })
                Button(action: {
                    
                }, label: {
                    HStack{
                        Text("Update")
                        Image(systemName: "checkmark.circle")
                    }
                })
                Button(action: {
                    
                }, label: {
                    HStack{
                        Text("Delete Account")
                            .foregroundColor(.red)
                    }
                })
                
            }
            .navigationTitle("Account Setting")
            
        }
    }
}

struct AccountSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingView()
    }
}
