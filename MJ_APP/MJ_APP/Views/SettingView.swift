//
//  SettingView.swift
//  MJ_APP
//
//  Created by admin on 9/1/2023.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Authorization.entity(), sortDescriptors: [], predicate: nil) var authorizationData: FetchedResults<Authorization>
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack{
            Form{
                Section(content: {
                    NavigationLink {
                        AccountSettingView()
                    } label: {
                        Text("Account settings")
                    }
                    NavigationLink {
                        SystemSettingView()
                    } label: {
                        Text("System settings")
                    }
                }, header: {
                    Text("General settings")
                })
                
                Section(content: {
                    Button(action: {
                        
                        for i in authorizationData{
                            moc.delete(i)
                        }
                        do{
                            try moc.save()
                        }
                        catch{
                            print(error)
                        }
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Logout")
                            .foregroundColor(.red)
                    })
                }, header: {
                    Text("Actions")
                })
            }
            .navigationTitle("Setting")
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
