//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/10/14.
//

import SwiftUI

struct ContentView: View {
    
    /// 默认不显示  这个注释可以折叠
    ///
    ///
    ///
    //
    
    //注释标题  这个注释可以折叠
    /*
     这是一个可以折叠的注释
     */
    @State var show = false
    @State var ViewState = CGSize.zero
    
    var body: some View {
        ZStack {
            BlurView(style: .systemMaterial)
            
            title()
                .blur(radius: show ? 20 : 0)
                .animation(.default, value: show)
                .offset(y: 60)
//                .edgesIgnoringSafeArea([.top])
            
            BottomCardView()
                .blur(radius: show ? 20 : 0)
                .animation(.default, value: show)
            
            CertificateView()
                .background(show ? Color.red : Color("background9"))
                .cornerRadius(15)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -320 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                .animation(.easeOut(duration: 0.7),value: show)
                .blendMode(.hardLight)
                .offset(x: ViewState.width,y: ViewState.height)
            
            CertificateView()
                .background(show ? Color("background5") : Color("background8"))
                .cornerRadius(15)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -150 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .animation(.easeOut(duration: 0.5),value: show)
                .blendMode(.hardLight)
                .offset(x: ViewState.width,y: ViewState.height)
            
            CertificateView()
                .background(Color.black)
                .cornerRadius(15)
                .shadow(radius: 20)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .offset(x: ViewState.width,y: ViewState.height)
                .animation(.spring(), value: show)
                .onTapGesture { self.show.toggle() }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.ViewState = value.translation
                            self.show = true
                        }
                        .onEnded{ value in
                            self.ViewState = CGSize.zero
                            self.show = false
                        }
                )
        }
        .edgesIgnoringSafeArea([.top,.bottom])
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/// 前面卡片视图
struct CertificateView: View {
    
    var item:Certificate = Certificate(title: "SwiftUI", imageName: "Background", width: 340, height: 220)

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent"))
                        .multilineTextAlignment(.center)
                        .padding(.top)
                    
                    Text(item.subtitle)
                        .foregroundColor(.white)
                }
                Spacer()
                Image("Logo")
                    .resizable().frame(width: 30,height: 30)
            }
            .padding(.horizontal)
            Image(item.imageName)
//                .resizable()
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
                .aspectRatio(contentMode: .fit)
                .offset(y:65)
                
        }
        .frame(width: item.width, height: item.height)
        .cornerRadius(15)
        .shadow(radius: 20)
        .clipped()
    }
}

/// 标题视图
struct title: View {
    var body: some View {
        VStack {
            HStack{
                Text("Certificate")
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
            }
            .padding()
            Image("Illustration5")
            Spacer()
        }.padding()
            .offset(y:20)
    }
}

/// 底部视图
struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20.0){
            
            Rectangle()
                .frame(width: 60,height: 6)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text( "This certificate is proof that Meng Tohas achieved the UI Design course withapproval from a Design+Code instructor.")
                .lineLimit(10)
            Spacer()
        }
        .frame(minWidth: 0,maxWidth: .infinity,minHeight: UIScreen.main.bounds.height,maxHeight: UIScreen.main.bounds.height)
        .padding()
        .padding(.horizontal)
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y:UIScreen.main.bounds.height - 150)
    }
}
