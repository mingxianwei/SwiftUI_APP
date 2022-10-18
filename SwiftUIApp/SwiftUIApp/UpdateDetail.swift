//
//  UpdateDetail.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/10/18.
//

import SwiftUI

struct UpdateDetail: View {
    var title: String
    var text: String
    var image: String
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(text)
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                .padding(.top,30)
            Spacer()
   
        }
        .padding(30)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        let item =  Update(image: "Illustration1", title: "SwiftUI", text: "Take your static design to the next level and build real apps with the simplicity of a prototpying tool. The best way to beginners to learn code, and the most efficient way for developers to learn design.", date: "JUN 26")
        
       return UpdateDetail(title: item.title, text: item.text, image:item.image)
    }
}


