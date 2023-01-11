//
//  ContentView.swift
//  MJ_APP
//
//  Created by admin on 1/1/2023.
//

import SwiftUI
import CoreData
import SceneKit
struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @FetchRequest(entity: Drawing.entity(), sortDescriptors: [], predicate: nil) var drawingData: FetchedResults<Drawing>
    
    @State var selectedIndex = 0
    
    let icons = [
        "square.grid.2x2",
        "pencil.line",
        "plus",
        "flag",
        "rectangle.and.pencil.and.ellipsis"
    ]
    
    let tabName = [
        "Home",
        "Drawing",
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

                            HomeView()

                        }
                    }
                case 1:
                    NavigationStack {
                        VStack{
                            DrawingView { UIImage in
                                
                            }
                            
                        }
                    }
                case 2:
                    NavigationStack {
                        VStack{
                            CreateView()
                            
                        }
                    }
                case 3:
                    NavigationStack{
                        VStack{

                            LocationView()
                        }.navigationTitle("Location")
                    }
                case 4:
                    NavigationStack{
                        VStack{
                            SettingView()
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


