//
//  PreferenceKeySample.swift
//  SwiftUIAdvancedLearning
//
//  Created by FerVP on 21/05/25.
//

import SwiftUI

struct PreferenceKeySample: View {
    @State private var title: String = "Hello sir"
    var body: some View {
        NavigationStack{
            VStack{
               SecondaryScreeen(text: title)
                    .preference(key: CustomTitlePreferenceKey.self, value: "New Value")
            }
            .navigationTitle(Text("PreferenceKey"))
            .onPreferenceChange(CustomTitlePreferenceKey.self){value  in
                
                self.title = value
            }
            
        }
    }
}

#Preview {
    PreferenceKeySample()
}

struct SecondaryScreeen : View {
    let text: String
    var body: some View {
        Text(text)
        
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
    static let defaultValue: String = ""
}
extension View {
    func customTitle (text:String ) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
        
    }
}
