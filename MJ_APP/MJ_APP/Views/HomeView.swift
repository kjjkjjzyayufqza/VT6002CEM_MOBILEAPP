//
//  HomeView.swift
//  MJ_APP
//
//  Created by admin on 4/1/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var readyToFrist : Bool = false
    @State private var readyToTwo : Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView{
                    NavigationLink(isActive: $readyToFrist, destination: {
                        DetailView(title: "Hand-carved Mahjong history",
                                   contents: "Mahjong, a tile-based game developed in China during the Qing dynasty, is a popular game played among Chinese communities. The distinctive sound of mahjong tiles clattering against each other on a wooden table—almost like large pebbles mixed in a bowl—can be recognised from a mile away. Each tile features different patterns and symbols that are traditionally engraved by hand. This particular form of art is so unique, it’s even listed as one of Hong Kong’s Intangible Cultural Heritages by the Government",
                                   image: "playing-mahjong",
                                   childrenText: Text("By [MAGGIE LAU](https://www.localiiz.com/post/culture-video-dying-arts-last-hand-carved-mahjong-tile-master-hong-kong)")
                        )
                    }, label: {
                        CardView(title: "History",
                                 image: "playing-mahjong",
                                 content: "Hand-carved Mahjong history",
                                 otherContent: "2022/1/11",
                                 onClick: {
                            readyToFrist = true
                        })
                        
                    })
                    
                    NavigationLink(isActive: $readyToTwo, destination: {
                        DetailView(title: "About the App",
                                   contents: "In this app, you can create your own mahjong models and preview them in real time with ar, which you can do through the Create navigation, and you can also draw through the Drawing navigation.",
                                   image: "E_FRONT",
                                   childrenText: Text("By [ME](https://github.com/kjjkjjzyayufqza)")
                        )
                    }, label: {
                        CardView(title: "About",
                                 image: "E_FRONT",
                                 content: "About the App",
                                 otherContent: "2022/1/11",
                                 onClick: {
                            readyToTwo = true
                        })
                        
                    })
                    
                    Spacer()

                }
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

