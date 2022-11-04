//
//  CustomCurvesBootcamp.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/3.
//

import SwiftUI

struct CustomCurvesBootcamp: View {
    var body: some View {
        ArcSample()
            .stroke(lineWidth: 5)
            .frame(width: 200,height: 200)
    }
}

struct CustomCurvesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomCurvesBootcamp()
    }
}

/// 绘画绘制 
struct ArcSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2.0,
                startAngle: Angle(degrees: -20),
                endAngle: Angle(degrees: 20),
                clockwise: true)
            /// 添加曲线  一个控制点
//            path.addQuadCurve(to: CGPoint(x: 0, y: 0), control: CGPoint(x: rect.midX, y: rect.midY))
            /// 添加曲线  两个控制点
//            path.addCurve(to: CGPoint(x: 100, y: 100), control1: CGPoint(x: rect.midX, y: rect.midY), control2: CGPoint(x: rect.maxX, y: rect.maxY))
            
        }
    }
}
