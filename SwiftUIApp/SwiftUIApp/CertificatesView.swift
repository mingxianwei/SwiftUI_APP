//
//  CertificatesView.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/10/18.
//

import SwiftUI

struct CertificateRow: View {
    
    var certificateArray = certificateData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text ("Certificates")
                .font(.system(size: 20))
                .fontWeight(.heavy)
                .padding(.leading,40)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack {
                    ForEach(certificateArray) { item in
                        CertificateView(item: item)
                            .background(Color.primary)
                            .cornerRadius(15)
                    }
                }
                .padding(20)
                .padding(.leading,20)
            }
        }
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificateRow()
    }
}



struct Certificate: Identifiable {
    var id = UUID()
    
    var  title:String
    var  subtitle:String = "Certificate"
    var  imageName:String
    var  width: CGFloat
    var  height: CGFloat
}

let certificateData = [
    Certificate(title: "OC", imageName: "Certificate1", width: 230, height: 150),
    Certificate(title: "Swift", imageName: "Certificate2", width: 230, height: 150),
    Certificate(title: "Java", imageName: "Certificate3", width: 230, height: 150),
    Certificate(title: "GO", imageName: "Certificate4", width: 230, height: 150),
]

