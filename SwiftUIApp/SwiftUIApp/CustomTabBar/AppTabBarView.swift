//
//  TabBar.swift
//  SwiftUIApp
//
//  Created by ζεδΌ on 2022/10/18.
//

import SwiftUI

struct AppTabBarView: View {
    
    @State private var selection: String = "Home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.red
//            Home()
                .tabBarItem(tab: .home,selection: $tabSelection)

            Color.green
//            ContentView()
                .tabBarItem(tab: .favorites,selection: $tabSelection)
            
            Color.orange
//            UpdateList()
                .tabBarItem(tab: .profile,selection: $tabSelection  )
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBarView()
            .environment(\.colorScheme, .light)
    }
}


extension AppTabBarView {
    
    private var defaultTabView: some View {
        
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
        }
        
    }
}
