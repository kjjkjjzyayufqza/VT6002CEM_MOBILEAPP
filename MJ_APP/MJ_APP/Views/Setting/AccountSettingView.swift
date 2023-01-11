//
//  AccountSettingView.swift
//  MJ_APP
//
//  Created by admin on 10/1/2023.
//

import SwiftUI
import CoreData
struct AccountSettingView: View {
    @State var email:String = ""
    @State var password:String = ""
    var network = Network()
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Authorization.entity(), sortDescriptors: [], predicate: nil) var authorizationData: FetchedResults<Authorization>
    
    var body: some View {
        NavigationStack{
            Form{
                Section(content: {
                    TextField("Email", text: $email)
                        .disabled(true)
                        
                    TextField("Password", text: $password)
                        .disabled(true)
                        
                       
                }, header: {
                    Text("User information")
                },footer: {
                    Text("Update account functionality will be added in the next release")
                })

                
            }
            .navigationTitle("Account Setting")
            .onAppear(){
                Task{
                    email = authorizationData.first?.userName ?? ""
                    password = authorizationData.first?.userPassword ?? ""
                }
            }
            
        }
    }
}

struct AccountSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingView()
    }
}
