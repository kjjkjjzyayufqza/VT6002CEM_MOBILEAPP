//
//  HomeView.swift
//  MJ_APP
//
//  Created by admin on 4/1/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var readyToNavigate : Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                //Color(hex: "F0EFF5").edgesIgnoringSafeArea(.all)
                ScrollView{
                    CardView(title: "History",
                             image: "playing-mahjong",
                             content: "Hand-carved Mahjong history",
                             otherContent: "2022/12/22",
                             onClick: {
                        readyToNavigate = true
                    })
                    .navigationDestination(isPresented: $readyToNavigate) {
                        DetailView(title: "Hand-carved Mahjong history",
                                   contents: "Mahjong, a tile-based game developed in China during the Qing dynasty, is a popular game played among Chinese communities. The distinctive sound of mahjong tiles clattering against each other on a wooden table—almost like large pebbles mixed in a bowl—can be recognised from a mile away. Each tile features different patterns and symbols that are traditionally engraved by hand. This particular form of art is so unique, it’s even listed as one of Hong Kong’s Intangible Cultural Heritages by the Government",
                                   image: "playing-mahjong",
                                   childrenText: Text("By [MAGGIE LAU](https://www.localiiz.com/post/culture-video-dying-arts-last-hand-carved-mahjong-tile-master-hong-kong)")
                        )
                    }
                    
                    CardView(title: "History",
                             image: "playing-mahjong",
                             content: "Hand-carved Mahjong history",
                             otherContent: "2022/12/22",
                             onClick: {
                        readyToNavigate = true
                    })
                    .navigationDestination(isPresented: $readyToNavigate) {
                        Text("a")
                    }
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
