//
//  PerferenceKeyBootcamp.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/4.
//

import SwiftUI

struct PerferenceKeyBootcamp: View {
    
    ///
    @State private var text: String = "Hello world"
    
    var body: some View {
        
        NavigationView {
            VStack {
                SecondaryScreen(text: text)
                    .navigationTitle(Text(text))
            }
        }
        /// 当子视图 获得了 preferenceKey 的改变时候 在这里拿到值赋值给text 这样值就能传递给父视图
        .onPreferenceChange(CustomTitleperferenceKey.self) { value in
            self.text = value
        }
    }
}

struct PerferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PerferenceKeyBootcamp()
    }
}


extension View {
    func customTitle(_ text:String) -> some View {
        self.preference(key: CustomTitleperferenceKey.self, value: text)
    }
}


struct SecondaryScreen: View {
    let text : String
    
    @State private var resultValue = "初始化值"
    var body: some View{
        Text(text)
            .onAppear(perform: getDateFromDatabase)
            .customTitle(resultValue)
    }
    
    /// 从数据库或者是网络获取数据
    func getDateFromDatabase()  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.resultValue = "Get Title From DataBase"
        }
    }
}

/// preferenceKey 可以帮助 将子视图的数据传递到父视图
struct CustomTitleperferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
}
