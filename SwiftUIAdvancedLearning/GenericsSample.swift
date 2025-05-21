//
//  GenericsSample.swift
//  SwiftUIAdvancedLearning
//
//  Created by FerVP on 21/05/25.
//

import SwiftUI

struct StringModel {
    let info : String?
    func removeInfo()-> StringModel{
        return .init(info: nil)
    }
}
struct BoolModel {
    let info : Bool?
    func removeInfo()-> BoolModel{
        return .init(info: nil)
    }
}
struct GenericModel<T> {
    let info : T?
    func removeInfo()-> GenericModel{
        return .init(info: nil)
    }
}

class GenericsViewModel:ObservableObject {
    @Published var stringModel : StringModel = .init(info: "Hello World")
    @Published var boolModel : BoolModel = .init(info: true)
    
    
    @Published var genericStringModel : GenericModel = .init(info: "Hello World")
    @Published var genericBoolModel : BoolModel = .init(info: true)
    init(){
        
    }
    func removeDataFromArray(){
       stringModel = stringModel.removeInfo()
        boolModel = boolModel.removeInfo()
        
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
    
}

struct GenericsSample: View {
    @StateObject var vm : GenericsViewModel = .init()
    var body: some View {
        VStack{
           
            Text(vm.stringModel.info ?? "NoData")
            
            Text(vm.boolModel.info?.description ?? "No Data")
            
            Text(vm.genericStringModel.info ?? "NoData")
            
            Text(vm.genericBoolModel.info?.description ?? "No Data")
        }.onTapGesture {
            vm.removeDataFromArray()
        }
    }
}

#Preview {
    GenericsSample()
}
