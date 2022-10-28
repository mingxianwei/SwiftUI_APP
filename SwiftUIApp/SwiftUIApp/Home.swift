//
//  Home.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/10/17.
//

import SwiftUI


let statusBarHeight: CGFloat =  SwiftUIApp.keyWindow?.windowScene?.statusBarManager!.statusBarFrame.size.height ?? 0
let screen = SwiftUIApp.keyWindow?.bounds ?? CGRectZero


struct Home: View {
    
    @State var showMenu  = false
    @State var showProfile = false
    
    @State var showSetting = false
    
    var body: some View {
        ZStack {
            ///
            HomeList()
                .blur(radius: showMenu ? 20 : 0)
                .scaleEffect(showMenu ? 0.95 : 1)
                .animation(.default, value: showMenu)
            ///
            ContentView()
                .cornerRadius(30)
                .shadow(radius: 20)
                .offset(y:showProfile ? 0 : UIScreen.main.bounds.height)
                .animation(.spring(), value: showProfile)
            
            MenuButtonView(show: $showMenu)
                .offset(x: -30,y: showProfile ? statusBarHeight : 88)
                .animation(.spring(), value: showProfile)
            
            MenuRightView(show: $showProfile)
                .offset(x:-16,y: showProfile ? statusBarHeight : 88)
                .animation(.spring(), value: showProfile)
            
            MenuView(showMenu: $showMenu,showSettings: $showSetting)
        }
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            Home().previewDevice(PreviewDevice(rawValue: "iPad Pro"))
        }
    }
}

struct MenuRow: View {
    var iconImageName: String
    var text: String
    var body: some View {
        HStack {
            Image(systemName: iconImageName)
                .imageScale(.large)
                .foregroundColor(Color.primary)
                .frame(width: 32,height: 32)
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}


struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let meunData = [
    Menu(title: "My Account", icon: "person.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Sttings", icon: "gearshape"),
    Menu(title: "Team", icon: "person.2"),
    Menu(title: "Sign Out", icon: "arrow.uturn.down")
]

struct MenuView: View {
    var menu = meunData
    @Binding var showMenu: Bool
    @Binding var showSettings:Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading , spacing: 20.0) {
                ForEach(menu) { item in
                    if item.title == "Sttings" {
                        Button {
                            showSettings.toggle()
                        } label: {
                            MenuRow(iconImageName:item.icon, text: item.title)
                        }.sheet(isPresented: $showSettings) {
//                            Settings()
                        }
                        
                    } else {
                        MenuRow(iconImageName:item.icon, text: item.title)
                    }
                    
                }
                Spacer()
            }
            .padding(.top,60)
            .padding(30)
            .frame(minWidth: 0,maxWidth: .infinity)
            .background(Color("background"))
            .cornerRadius(30)
            .padding(.trailing,60)
            .shadow(radius: 20)
            .rotation3DEffect(Angle(degrees: showMenu ? 0 : 30), axis: (x: 0, y: 5.0, z: 0))
            .animation(.spring(), value: showMenu)
            .offset(x: showMenu ? 0 : -UIScreen.main.bounds.width)
            
            .onTapGesture {self.showMenu.toggle()}
            Spacer()
        }
        .padding(.top ,statusBarHeight)
    }
}

struct ButtonCircleView: View {
    
    var iconName: String = "person.circle"
    
    var body: some View {
        HStack{
            Image(systemName: iconName)
                .foregroundColor(.primary)
                .imageScale(.large)
            
        }
        .frame(width:44,height: 44)
        .background(BlurView(style: .systemThickMaterial))
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10,x: 0,y: 10)
    }
}

struct MenuButtonView: View {
    
    @Binding var show:Bool
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.clear
            Button {show.toggle()} label: {
                HStack{
                    Spacer()

                    Image(systemName: "list.dash")
                        .foregroundColor(.primary)
                }
                .padding(.trailing,20)
                .frame(width:90,height: 60)
                .background(BlurView(style: .systemThickMaterial))
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10,x: 0,y: 10)
            }
            Spacer()
        }
    }
}

struct MenuRightView: View {
    @Binding var show: Bool
    var body: some View {
        ZStack(alignment: .topTrailing){
            Color.clear
            HStack{
                Button {show.toggle()} label: {
                    ButtonCircleView(iconName: "person.circle")
                }
                
                Button {show.toggle()} label: {
                    ButtonCircleView(iconName: "bell")
                }
            }.padding(.trailing,20)
            
            Spacer()
        }
    }
}
