//
//  KeyPathsSample.swift
//  SwiftUIAdvancedLearning
//
//  Created by FerVP on 29/05/25.
//

import SwiftUI

struct MyModel : Identifiable {
    var id = UUID().uuidString
    var title: String
    let count: Int
    let date: Date
}
struct MovieTitle{
    let primaryTitle: String
    let secondaryTitle : String
}

struct KeyPathsSample: View {
    @AppStorage("user_count") var userCount: Int = 0
    @State var dataArray: [MyModel] = []
    var body: some View {
        VStack{
            ForEach(dataArray) { item in
                Text(item.title)
            }
        }
            .onAppear {
                let  array = [
                MyModel(title: "Test3", count: 3, date: .now),
                MyModel(title: "Test1", count: 1, date: .now),
                MyModel(title: "Test2", count: 2, date: .now)
            ]
//            array.sort { $0.count <  $1.count }
//            let newArray = array.customSorted()
//                let newArray = array.customSorted2(keyPath: \.count)
                let newArray = array.customSorted3(keyPath: \.title)
            dataArray = newArray
            let item = MyModel(title: "Test", count: 1, date: .now)
            
                _ = item.title
                _ = item[keyPath: \.title]
            
            
        }
    }
}

#Preview {
    KeyPathsSample()
}
extension Array where Element == MyModel {
    func customSorted() -> [MyModel] {
        self.sorted { $0.count <  $1.count }
    }
    func customSorted2(keyPath: KeyPath<MyModel, Int >) -> [MyModel] {
        self.sorted { $0[keyPath:keyPath]  <  $1[keyPath:    keyPath]}
    }
    
    func customSorted3<T: Comparable>(keyPath: KeyPath<MyModel, T >) -> [Element] {
        self.sorted { $0[keyPath:keyPath]  <  $1[keyPath:    keyPath]
        }
    }
}
