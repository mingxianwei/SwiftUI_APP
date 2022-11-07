//
//  CustomTabBarView.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/4.
//

import SwiftUI




struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @State var localSelection: TabBarItem
    
    @Namespace private var nameSpace
    
    var body: some View {
        tabBarVersion1
            .onChange(of: selection) { newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}

//MARK: - === Extension ===

/// version1  普通效果
extension CustomTabBarView {
    
    private var tabBarVersion1: some View {
        HStack{
            ForEach(tabs,id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
    
    private func tabView(tab:TabBarItem) -> some View {
        VStack{
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10,weight: .semibold,design: .rounded))
        }.foregroundColor(localSelection == tab ? tab.color : Color.gray)
            .padding(.vertical,8)
            .frame(maxWidth: .infinity)
            .background(localSelection == tab ? tab.color.opacity(0.2) :  Color.gray.opacity(0.2) )
            .cornerRadius(10)
    }
    
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
    
}


/// Version2  浮空效果
extension CustomTabBarView {
    
    
    private var tabBarVersion2: some View {
        HStack{
            ForEach(tabs,id: \.self) { tab in
                tabView2(tab: tab)
                    .onTapGesture{switchToTab(tab: tab)}
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
    
    /// 构建tabBar 视图
    private func tabView2(tab:TabBarItem) -> some View {
        VStack{
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10,weight: .semibold,design: .rounded))
        }.foregroundColor(localSelection == tab ? tab.color : Color.gray)
            .padding(.vertical,8)
            .frame(maxWidth: .infinity)
            .background(
                ZStack{
                    if localSelection == tab {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(tab.color.opacity(0.2))
                            .matchedGeometryEffect(id: "Background_Rectangle", in: nameSpace)
                    }
                }
            
            )
    }
}




//MARK: - === 预览 ===
/// 预览
struct CustomTabBarView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [.home,.favorites,.profile]
    static var previews: some View {
        VStack{
            Spacer()
            CustomTabBarView(
                tabs: tabs,
                selection: .constant(tabs.first!),
                localSelection:tabs.first!
            )
        }
    }
}


