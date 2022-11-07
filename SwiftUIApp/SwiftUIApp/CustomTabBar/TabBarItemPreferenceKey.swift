//
//  TabBarItemPreferenceKey.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/7.
//

import Foundation
import SwiftUI

struct TabBarItemPreferenceKey: PreferenceKey {
    
    
     static var defaultValue: [TabBarItem] = []
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}


struct TabBarItemViewModifer: ViewModifier {
    
    let tab:TabBarItem
    @Binding var selection: TabBarItem
    
    func body(content: Content) -> some View {
        content
            .preference(key: TabBarItemPreferenceKey.self, value: [tab])
            .opacity(selection == tab ? 1.0 : 0)
    }
}

extension View {
    
    func tabBarItem(tab: TabBarItem,selection: Binding<TabBarItem>) -> some View {
        self
            .modifier(TabBarItemViewModifer(tab: tab, selection: selection))
    }
}
