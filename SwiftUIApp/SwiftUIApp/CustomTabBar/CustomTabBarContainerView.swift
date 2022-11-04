//
//  CustomTabBarContainnerView.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/4.
//

import SwiftUI


//struct TabView2<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View{
//
//}
//
//
//struct TabView3<SelectionValue, Content> : View where SelectionValue : Hashable, Content : View{
//
//}


struct CustomTabBarContainerView<Content: View>: View {
    
    let content:Content
    @Binding var selection: TabBarItem
    @State private var tabs: [TabBarItem] =  [
        TabBarItem(iconName: "house", title: "Home", color: Color.red),
        TabBarItem(iconName: "heart", title: "Favorites", color: Color.blue),
        TabBarItem(iconName: "person", title: "Profile", color: Color.red)
    ]
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content){
        self._selection = selection
        self.content = content()
    }
    var body: some View {
        VStack{
            ZStack{
                content
            }
            CustomTabBarView(tabs: tabs, selection: $selection)
        }
    }
}

struct CustomTabBarContainnerView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        TabBarItem(iconName: "house", title: "Home", color: Color.red),
        TabBarItem(iconName: "heart", title: "Favorites", color: Color.blue),
        TabBarItem(iconName: "person", title: "Profile", color: Color.red)
    ]
    
    static var previews: some View {
        
        CustomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
