//
//  LazyGridBootcamp.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/9.
//

import SwiftUI

struct LazyGridBootcamp: View {
    var body: some View {
        let columns: [GridItem] = [
            
            GridItem(.fixed(50), spacing: nil, alignment: .center),  //
            GridItem(.fixed(75), spacing: nil, alignment: .center),
            GridItem(.fixed(100), spacing: nil, alignment: .center),
            GridItem(.fixed(120), spacing: nil, alignment: .center),  //
            GridItem(.fixed(75), spacing: nil, alignment: .center),
            GridItem(.fixed(50), spacing: nil, alignment: .center)
        ]
        
        LazyVGrid(columns: columns) {
            
            ForEach(0..<27) { index in
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 50)
                    .background(Color.white)
            }
            
        }
    }
}

struct LazyGridBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LazyGridBootcamp()
    }
}
