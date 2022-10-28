//
//  HomeList.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/10/17.
//

import SwiftUI

struct HomeList: View {
    
    @State var showModel = false
    var courseArray = courseData
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Course")
                            .font(.title)
                            .fontWeight(.heavy)
                        Text("22 courses")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }
                    Spacer()
                }
                .padding(.leading,70)
                .padding(.bottom,30)

                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 30.0) {
                        ForEach(courseData) { datum in
                            Button {
                                self.showModel.toggle()
                            } label: {

                                GeometryReader(content: { GeometryProxy in
                                    CourseView(course: datum)
                                        .padding(.trailing,20)
                                        .rotation3DEffect(Angle(degrees:Double(GeometryProxy.frame(in: .global).minX - 40 ) / -15), axis: (x: 0, y: 50, z: 0))
                                })
                                .frame(width: 246,height: 360)
                            }.sheet(isPresented: $showModel) {
                                ContentView()
                            }
                            
                        }
                    }
                }
                .padding(.leading,20)
                
                CertificateRow()
                    .padding(.top,20)
                Spacer()
            }.padding(.top,78)
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            Home().previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            Home().previewDevice(PreviewDevice(rawValue: "iPhone 14 Plus"))
            Home().previewDevice(PreviewDevice(rawValue: "iPad Pro"))
        }
    }
}


struct CourseView: View {
    var course:Course
    var body: some View {
        VStack(alignment: .leading){
            Text(course.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .lineLimit(4)
                .padding(15)
                .frame(width: 200)
            
            Spacer()
            Image(course.image)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width: 246,height: 200)
            
        }
        .frame(width: 246,height: 360)
        .background(course.background)
        .cornerRadius(30)
        .shadow(color: course.shadowColor, radius: 10, x: 0, y: 10)
        .padding(.trailing,30)
    }
}



struct Course: Identifiable {
    var id =  UUID()
    var title: String
    var image: String
    var background: Color
    var shadowColor: Color = Color("backgroundShadow3")
}


let courseData = [
    Course(
        title: "Build an App with SwiftUI",
        image: "Illustration1",
        background: Color("background3"),
        shadowColor: Color("backgroundShadow3")
    ),
    
    Course(
        title: "Design and animate your UI",
        image: "Illustration2",
        background: Color("background7")
    ),
    Course(
        title: "Animate your UI like a boss",
        image: "Illustration3",
        background: Color("background8")
    ),
    Course(
        title: "Gestures and Interruptible animations",
        image: "Illustration4",
        background: Color("background9")
    ),
    
    Course(
        title: "Design and animate your UI",
        image: "Illustration2",
        background: Color("background7")
    ),
    Course(
        title: "Animate your UI like a boss",
        image: "Illustration3",
        background: Color("background8")
    ),
    Course(
        title: "Gestures and Interruptible animations",
        image: "Illustration4",
        background: Color("background9")
    )
    
]


