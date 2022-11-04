//
//  AnyTransitonBootcamp.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/3.
//

import SwiftUI


struct RotateViewModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? UIScreen.main.bounds.width : 0 ,
                y: rotation != 0 ? UIScreen.main.bounds.height : 0)
    }
}

/// 自定义转场
extension AnyTransition {
    
    /// 非对称 转场
    static var rotateOn: AnyTransition {
        return AnyTransition.asymmetric(
            insertion: .rotating,
            removal: .move(edge: .leading))
    }
    
    /// 对称转场 默认180度
    static var rotating: AnyTransition {
        return AnyTransition.modifier(
            active: RotateViewModifier(rotation: 180),
            identity: RotateViewModifier(rotation: 0))
    }
    /// 对称转场 自定义角度
    static func rotating(amout: Double ) -> AnyTransition {
        return AnyTransition.modifier(
            active: RotateViewModifier(rotation: amout),
            identity: RotateViewModifier(rotation: 0))
    }
}


struct AnyTransitonBootcamp: View {
    
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 25, style: .circular)
                    .frame(width: 250,height:350)
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
//                    .modifier(RotateViewModifier(rotation: 180))
//                    .transition(.rotating(amout: 1080))//  对称插入和退出
                    .transition(.rotateOn)
            }
            
            Spacer()
            
            Text("点我")
                .withDefautButtonFormatting()
                .padding(.horizontal,40)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5) ) {
                        showRectangle.toggle()
                    }
                }
                
        }
    }
}

struct AnyTransitonBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnyTransitonBootcamp()
    }
}
