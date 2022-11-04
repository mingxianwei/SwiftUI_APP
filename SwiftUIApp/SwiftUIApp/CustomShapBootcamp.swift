//
//  CustomShapBootcamp.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/3.
//

import SwiftUI

/// 顶点在 起始中间 底边重合的 三角形
struct Tringle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
    
    
}


struct CustomShapBootcamp: View {
    var body: some View {
        ZStack {
            Tringle()
            
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: 50, dash: [15], dashPhase: 0))
            
                .foregroundColor(Color.blue)
            
                
//                .trim(from:0 ,to: 0.5)  ///
            ///渐变色填充
//                .fill(LinearGradient(gradient: Gradient(colors: [Color.red,Color.blue]),startPoint: .leading,endPoint: .trailing))
                .frame(width: 300,height: 300)
        }
    }
}

struct CustomShapBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapBootcamp()
    }
}
