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
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @FetchRequest(entity: Drawing.entity(), sortDescriptors: [], predicate: nil) var drawingData: FetchedResults<Drawing>
    
    @FetchRequest(entity: Authorization.entity(), sortDescriptors: [], predicate: nil) var authorizationData: FetchedResults<Authorization>

    var body: some View {
        CreateView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
