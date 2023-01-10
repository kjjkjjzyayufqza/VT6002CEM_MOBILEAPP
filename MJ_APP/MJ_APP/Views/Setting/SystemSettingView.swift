//
//  SystemSettingView.swift
//  MJ_APP
//
//  Created by admin on 10/1/2023.
//

import SwiftUI

struct SystemSettingView: View {
    @State var isOnDisApi:Bool = false
    var body: some View {
        NavigationStack{
            Form{
                Section(content: {
                    Toggle("Disable API Call", isOn: $isOnDisApi)
                       
                }, header: {
                    Text("")
                },footer: {
                    Text("If you cannot log in or go offline, you can choose to close the api and let the app run in offline mode")
                })
            }
            .navigationTitle("System Setting")
        }
    }
}

struct SystemSettingView_Previews: PreviewProvider {
    static var previews: some View {
        SystemSettingView()
    }
}
