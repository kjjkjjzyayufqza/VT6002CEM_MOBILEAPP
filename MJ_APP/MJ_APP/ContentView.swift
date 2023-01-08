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
    
    @State var selectedIndex = 0
    
    let icons = [
        "square.grid.2x2",
        "bubble.right",
        "plus",
        "flag",
        "rectangle.and.pencil.and.ellipsis"
    ]
    
    let tabName = [
        "Home",
        "News",
        "Create",
        "Location",
        "Setting"
    ]
    
    var body: some View {
        VStack{
            //Body
            ZStack{
                switch selectedIndex{
                case 0:
                    NavigationStack {
                        VStack{
//                            LocationView()
                            HomeView()
//                            ARViewContainer()
                        }
                    }
                case 1:
                    NavigationStack {
                        VStack{
                            SceneView()
                            
                        }.navigationTitle("Title 2")
                    }
                case 2:
                    NavigationStack {
                        VStack{
                            DrawingView()
                            
                        }.navigationTitle("Title 3")
                    }
                case 3:
                    NavigationStack{
                        VStack{
//                            var scene:SCNScene? = .init(named: "Tomato.usdz")
//                            SceneView(scene: scene)
                            LocationView()
                        }.navigationTitle("Location")
                    }
                case 4:
                    NavigationStack{
                        VStack{
                            CreateView()
                        }
                    }
                default:
                    NavigationStack {
                        VStack{
                            Text("1")
                            
                        }.navigationTitle("Title")
                    }
                }
            }
            HStack{

                ForEach(0..<5, id: \.self){ number in
                    Spacer().frame(width: 0)
                    Button (action:{
                        self.selectedIndex = number
                    } ,label: {
                        VStack{
                            Image(systemName: icons[number])
                                .font(.system(size: 25,
                                              weight: .regular,
                                              design: .default))
                                .foregroundColor(selectedIndex == number ? .black : Color(UIColor.lightGray))
                                .frame(height: 25)
                            Text(tabName[number])
                                .foregroundColor(selectedIndex == number ? .black : Color(UIColor.lightGray))
                        }
                    })
                    .frame(maxWidth: .infinity)
                    Spacer().frame(width: 0)
                }
                
            }
            .background(Color.white)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
