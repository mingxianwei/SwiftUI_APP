//
//  ScrollViewOffsetPreferenceKeyBootcamp.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/4.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


extension View {
    func onScrollViewOffsetChanged(action: @escaping (_ offset: CGFloat) -> Void) -> some View {
        self
            .background {GeometryReader { Text("").preference(key: ScrollViewOffsetPreferenceKey.self, value:$0.frame(in: .global).minY ) }}
            .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { action($0) }
        
    }
}


struct ScrollViewOffsetPreferenceKeyBootcamp: View {
    
    let title: String = "New Title Here!"
    
    @State private var scrollviewOffset: CGFloat = 0
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack{
                    titleLayer
                        .opacity(Double(scrollviewOffset) / 63.0)
                        .onScrollViewOffsetChanged { offset in self.scrollviewOffset = offset }
                    contentLayer
                }.padding()
            }
            .overlay(
                navBarLayer
                    .opacity(scrollviewOffset < 40 ? 1.0 : 0)
                    .animation(.easeInOut, value: scrollviewOffset),
                alignment: .top)
        }
    }
}

struct ScrollViewOffsetPreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewOffsetPreferenceKeyBootcamp()
    }
}

extension ScrollViewOffsetPreferenceKeyBootcamp {
    private var titleLayer: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    private var contentLayer: some View {
        ForEach(0..<100) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.3))
                .frame(width: 300,height: 200)
        }
    }
    
    private var navBarLayer: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.blue)
    }
}
