//
//  UpdateList.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/10/18.
//

import SwiftUI

struct UpdateList: View {
    
    var updateDataArray = updateData
    
    @State var setting:Bool = false
    
    var body: some View {
        NavigationView {
            List(updateDataArray) { item in
                NavigationLink(destination: UpdateDetail(title: item.title, text: item.text, image: item.image)) {
                    HStack(spacing: 10.0) {
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80,height: 80)
                            .background(Color("background"))
                            .cornerRadius(20)
                            .foregroundColor(.black)
                        
                        VStack(alignment: .leading){
                            Text(item.title)
                                .font(.headline)
                                .fontWeight(.medium)
                            Text(item.text)
                                .lineLimit(2)
                                .lineSpacing(4)
                                .frame(height:50)
                                .font(.subheadline)
                            Text(item.date)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle(Text("Update"))
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                Button {
                    setting.toggle()
                } label: {
                    Image(systemName: "gear")
                        .foregroundColor(.black)
                }.sheet(isPresented: $setting) {
                    Text ("Detail")
                }
            }
            
            
        }
        
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}



struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Illustration1", title: "SwiftUI", text: "Take your static design to the next level and build real apps with the simplicity of a prototpying tool. The best way to beginners to learn code, and the most efficient way for developers to learn design.", date: "JUN 26"),
    Update(image: "Illustration2", title: "Framer X", text: "Framer makes it incredibly easy to add complex user interactions inside your prototype, taking your design and code components to the next level. Playground allows you to quickly test new concepts within the all - new in -app code editor. You can combine your current app flow with new code components created in Playground.", date: "JUN 11"),
    Update(image: "Illustration3", title: "CSS Layout", text: "Learn how to combine CSS Grid, Flexbox, animations and responsive design to create a beautiful prototype in CodePen.", date: "MAY 26"),
    Update(image: "Illustration4", title: "React Native", text: "Learn how to implement gestures, Lottie animations and Firebase login.", date: "MAY 15"),
    Update(image: "Certificate1", title: "Unity", text: "Unity course teaching basics, C#, assets, level design and gameplay", date: "MAR 19")
]
