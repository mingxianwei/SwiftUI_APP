//
//  AnmateableBootcamp.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/4.
//

import SwiftUI

struct AnmateableBootcamp: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
        ZStack {
//            RectangleWithSingleCornerAnimation(cornerRadius: animate ? 60 : 0)
            Pacman(cornerRadius: animate ? 20 : 0)
                .frame(width: 250,height: 250)
        }
        .onAppear(){
            withAnimation (Animation.linear(duration: 0.35).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct AnmateableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnmateableBootcamp()
    }
}


struct RectangleWithSingleCornerAnimation: Shape {
    var cornerRadius: CGFloat
    /// shape-> Animate -> animateableDate  需要完成动画的属性写在这个里面就可以执行动画了
    var animatableData: CGFloat {
        get{cornerRadius}
        set{cornerRadius = newValue}
    }

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY-cornerRadius))
            
            path.addArc(
                center: CGPoint(x: rect.maxX-cornerRadius, y: rect.maxY-cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 360),
                clockwise: false)

            path.addLine(to: CGPoint(x: rect.maxX-cornerRadius, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

/// 吃豆人
struct Pacman: Shape {
    
    var cornerRadius: CGFloat
    /// shape-> Animate -> animateableDate  需要完成动画的属性写在这个里面就可以执行动画了
    var animatableData: CGFloat {
        get{cornerRadius}
        set{cornerRadius = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.minY),
                radius: rect.height/2.0,
                startAngle: Angle(degrees: cornerRadius),
                endAngle: Angle(degrees: 360.0 - cornerRadius),
                clockwise: false)
             
        }
    }
}
