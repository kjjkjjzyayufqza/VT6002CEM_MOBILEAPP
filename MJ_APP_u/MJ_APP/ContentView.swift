//
//  ContentView.swift
//  MJ_APP
//
//  Created by admin on 1/1/2023.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0
    
    let icons = [
        "house",
        "gear",
        "plus",
        "lasso",
        "message"
    ]
    var body: some View {
        VStack{
            //Body
            ZStack{
                switch selectedIndex{
                case 0:
                    NavigationStack {
                        VStack{
                            CardView()
                            
                        }.navigationTitle("Title 1")
                    }
                case 1:
                    NavigationStack {
                        VStack{
                            Text("2")
                            
                        }.navigationTitle("Title 2")
                    }
                default:
                    NavigationStack {
                        VStack{
                            Text("1")
                            
                        }.navigationTitle("Title")
                    }
                }
            }
            Spacer()
            Divider()
            HStack{
                ForEach(0..<5, id: \.self){ number in
                    Spacer()
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
                            Text(icons[number])
                                .foregroundColor(selectedIndex == number ? .black : Color(UIColor.lightGray))
                        }
                    })
                    Spacer()
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
