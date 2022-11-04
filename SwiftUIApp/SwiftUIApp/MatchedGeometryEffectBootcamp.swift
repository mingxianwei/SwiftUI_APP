//
//  MatchedGeometryEffectBootcamp.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/3.
//

import SwiftUI

struct MatchedGeometryEffectBootcamp: View {
    
    @State private var isClicked: Bool = false
    
    @Namespace private var nameSpace
    
    var body: some View {
        VStack{
            
            if !isClicked {
                RoundedRectangle(cornerRadius: 25, style: .circular)
                    .matchedGeometryEffect(id: "rectangle", in: nameSpace)
                    .frame(width: 100,height: 100)
            }
            
            Spacer()
            
            if isClicked {
                RoundedRectangle(cornerRadius: 25, style: .circular)
                    .matchedGeometryEffect(id: "rectangle", in: nameSpace)
                    .frame(width: 200,height: 300)
                   
            }

        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

struct MatchedGeometryEffectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGrometryEffectExample2()
    }
}


struct MatchedGrometryEffectExample2: View {
    
    let categories: [String] = ["Home", "Popular","Saved"]
    @State private var selectedString: String = "Home"
    
    @Namespace private var nameSpace2
     
    var body: some View {
        HStack {
            ForEach(categories,id:\.self){ category in
                ZStack(alignment: .bottom) {
                    if selectedString == category {
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color.red.opacity(0.5 ))
                            .matchedGeometryEffect(id: "selectedCategory", in: nameSpace2)
                            .frame(width: 55,height: 2)
                            .offset(y:10)
                    }
                   
                    Text(category)
                        .foregroundColor(selectedString == category ? Color.red : Color.black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selectedString = category
                    }
                }
            }
        }
    }
}
