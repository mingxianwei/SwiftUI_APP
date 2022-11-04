//
//  ButtonStyleBootcam.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/3.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    /// 默认初始化器  默认为 0.5
    init(scaledAmount: CGFloat = 0.01) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.5 : 1.0)
//            .brightness(configuration.isPressed ? 0.3 : 0)
            .scaleEffect(configuration.isPressed ? scaledAmount : 1)
    }
}

/// 给视图 添加 点击样式
extension View {
    func withPressableStyle(scaleAmount: CGFloat = 0.05) -> some View {
        self.buttonStyle(PressableButtonStyle(scaledAmount: scaleAmount))
    }
}


struct ButtonStyleBootcamp: View {
    var body: some View {
        
        Button {
            //TODO:
        } label: {
            Text("Click Me")
                .withDefautButtonFormatting()
        }
        .withPressableStyle(scaleAmount: 1.2)
        .padding(40)
        
        
    }
}

struct ButtonStyleBootcam_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp()
    }
}
