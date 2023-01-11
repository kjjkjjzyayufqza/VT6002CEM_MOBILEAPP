//
//  ContentView.swift
//  MJ_APP
//
//  Created by admin on 1/1/2023.
//

import SwiftUI
import CoreData
import SceneKit
struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Authorization.entity(), sortDescriptors: [], predicate: nil) var authorizationData: FetchedResults<Authorization>

    var body: some View {
        if authorizationData.count > 0{
            MainView()
        }else{
            LoginView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
