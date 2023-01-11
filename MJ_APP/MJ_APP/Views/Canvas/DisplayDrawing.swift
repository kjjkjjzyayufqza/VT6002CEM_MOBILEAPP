//
//  DisplayDrawing.swift
//  MJ_APP
//
//  Created by admin on 3/1/2023.
//

import SwiftUI

struct DisplayDrawing: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @State var id:UUID?
    @State var data:Data?
    @State var title:String?
    var body: some View {
        VStack{
            GeometryReader(content: { geometry in
                DrawingCanvasView(data: data ?? Data(), id: id ?? UUID())
                    .environment(\.managedObjectContext, viewContext)
                    .navigationBarTitle(title ?? "Untitled",displayMode: .inline)

            })

        }
    }
}


struct DisplayDrawing_Previews: PreviewProvider {
    static var previews: some View {
        DisplayDrawing()
    }
}
