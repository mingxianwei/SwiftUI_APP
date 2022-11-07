//
//  TabBarItem.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/7.
//

import Foundation
import SwiftUI


//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}


enum TabBarItem: Hashable {
    case home,favorites,profile
    var iconName: String{
        switch self {
        case .home: return "house"
        case .favorites: return "heart"
        case .profile: return "person"
        }
    }
    
    var title: String{
        switch self {
        case .home: return "Home"
        case .favorites: return "Favorites"
        case .profile: return "Profile"
        }
    }
    
    var color: Color{
        switch self {
        case .home: return Color.red
        case .favorites: return Color.green
        case .profile: return Color.blue
        }
    }
}


