//
//  MJ_APPApp.swift
//  MJ_APP
//
//  Created by admin on 3/1/2023.
//

import SwiftUI

@main
struct MJ_APPApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
