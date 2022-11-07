//
//  CustomTabBarContainnerView.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/4.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    let content:Content
    @Binding var selection: TabBarItem
    @State private var tabs: [TabBarItem] =  [.home,.profile,.favorites]
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content){
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            content
                .edgesIgnoringSafeArea(.vertical)
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: tabs.first!)
        }
        .onPreferenceChange(TabBarItemPreferenceKey.self) { value in self.tabs = value}
    }
}

struct CustomTabBarContainnerView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [.home,.favorites,.profile]
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}

