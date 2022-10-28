//
//  SwiftUIAppApp.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/10/14.
//

import SwiftUI

@main
struct SwiftUIApp: App {
    static var keyWindow: UIWindow? {
            var window: UIWindow?
            if #available(iOS 13.0, *) {
                window = UIApplication.shared.connectedScenes
                    .filter({ $0.activationState == .foregroundActive })
                    .map({ $0 as? UIWindowScene })
                    .compactMap({ $0 })
                    .last?.windows
                    .filter({ $0.isKeyWindow })
                    .last
            } else {
                window = UIApplication.shared.keyWindow
            }
            return window
    }
    
    var body: some Scene {
        WindowGroup {
            TabBar()
        }
    }
}



