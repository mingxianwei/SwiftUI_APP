//
//  ViewModifierBootCamp.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/3.
//

import SwiftUI


/// 默认 按钮样式 修改器
struct DefaultButtonViewModifier: ViewModifier {
    let backgroundColor: Color
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(15)
            .shadow(radius: 15)
    }
}

/// 视图扩展为默认样式扩展器
extension View {
    func withDefautButtonFormatting(bacgroundColor: Color = .blue) -> some View {
        self.modifier(DefaultButtonViewModifier(backgroundColor: bacgroundColor))
    }
}


struct ViewModifierBootCamp: View {
    
    var body: some View {
        
        VStack(spacing: 20.0) {
            Text("Hello, World!")
                .font(.headline)
                .modifier(DefaultButtonViewModifier(backgroundColor: Color.blue))
                
            Text("Hello, World2")
                .font(.title)
                .withDefautButtonFormatting(bacgroundColor: .orange)
            
            Text("Hello, World!")
                .font(.subheadline)
                .withDefautButtonFormatting()
        }.padding()
    }
}

struct ViewModifierBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootCamp()
    }
}
