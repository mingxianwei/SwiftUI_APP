//
//  TabBar.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/10/18.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView() {
            Home()
                .tag(1)
                .tabItem {
                    Label("Home", image: "IconHome")
                }
            
            ContentView().tabItem {
                VStack {
                    Image("IconCards")
                    Text("Certificates")
                }
            }.tag(2)
            
            UpdateList().tabItem {
                VStack {
                    Image("IconSettings")
                    Text("Updates")
                }
            }.tag(3)
        }
        //        .edgesIgnoringSafeArea([.top,.bottom])
        .foregroundColor(Color.black)
        .background(Color.gray)
    }
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environment(\.colorScheme, .dark)
    }
}
