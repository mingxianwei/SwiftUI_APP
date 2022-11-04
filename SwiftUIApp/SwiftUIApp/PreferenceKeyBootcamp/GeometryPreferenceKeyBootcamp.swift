//
//  GeometryPreferenceKeyBootcamp.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/4.
//

import SwiftUI

struct GeometryPreferenceKeyBootcamp: View {
    
    @State private var rectSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .frame(width: rectSize.width,height: rectSize.height)
                .background(Color.blue)
            Spacer()
            HStack{
                Rectangle()
                GeometryReader { geo in
                    Rectangle()
                        .updateRectangleGeoSize(geo.size)
                }
               
                Rectangle()
            }.frame(height: 55)
        }
        .onPreferenceChange(RectangleGeoSizePreferenceKey.self) { size in
            rectSize = size
        }
    }
}

struct GeometryPreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryPreferenceKeyBootcamp()
    }
}


extension View {
    func updateRectangleGeoSize(_ size:CGSize) -> some View {
        preference(key: RectangleGeoSizePreferenceKey.self, value: size)
    }
}

struct  RectangleGeoSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}
