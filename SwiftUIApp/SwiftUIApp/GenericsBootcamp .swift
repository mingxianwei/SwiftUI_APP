//
//  GenericsBootcamp .swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/11/4.
//

import SwiftUI


/// 泛型
struct GernicModel<T>{
    let info:T?
    func removeInfo() -> GernicModel {
        GernicModel(info: nil)
    }
}




struct StringModel {
    let info: String?
    func removeInfo() -> StringModel  {
        StringModel(info: nil)
    }
}


class GenericsViewModel: ObservableObject {
    
    @Published var stringModel = StringModel(info: "Hello,world")
    @Published var genericStringModel = GernicModel(info: "这是泛型")
    @Published var genericBoolModel = GernicModel(info: true)
    
    
    func removeData()  {
        stringModel = stringModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
        
    }
}

 

struct GenericsBootcamp_: View {
    
    @StateObject private var viewModel = GenericsViewModel()
    
    var body: some View {
        VStack {
            
            Text(viewModel.stringModel.info?.description ?? "No Data")
            
            Text(viewModel.genericBoolModel.info?.description ?? "No Data")
            
            Text(viewModel.genericStringModel.info?.description ?? "No Data")
                .onTapGesture {
                    viewModel.removeData()
                }
        }
    }
}

struct GenericsBootcamp__Previews: PreviewProvider {
    static var previews: some View {
        GenericsBootcamp_()
    }
}
