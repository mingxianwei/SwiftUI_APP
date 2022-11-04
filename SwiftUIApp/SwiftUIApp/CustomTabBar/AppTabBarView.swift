//
//  TabBar.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/10/18.
//

import SwiftUI

struct AppTabBarView: View {
    
    @State private var selection: String = "Home"
    
    var body: some View {
        TabView(selection: $selection) {
            
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            
            
//            Home()
//                .tabItem {
//                    Label("Home", image: "IconHome")
//                }
//
//            ContentView().tabItem {
//                VStack {
//                    Image("IconCards")
//                    Text("Certificates")
//                }
//            }
//
//            UpdateList().tabItem {
//                VStack {
//                    Image("IconSettings")
//                    Text("Updates")
//                }
//            }
        }
    }
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBarView()
            .environment(\.colorScheme, .light)
    }
}
