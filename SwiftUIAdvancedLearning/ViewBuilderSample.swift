//
//  ViewBuilderSample.swift
//  SwiftUIAdvancedLearning
//
//  Created by FerVP on 21/05/25.
//

import SwiftUI
struct HeaderViewRegular : View {
    let title: String
    let description: String
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(description)
                .font(.callout)
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
            
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding()
    }
}
struct HeaderViewGeneric<Content:View> : View {
    let title: String
   @ViewBuilder let content: Content
    

    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            content
            
         
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
            
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding()
    }
}

struct ViewBuilderSample: View {
    var body: some View {
        VStack{
            HeaderViewRegular(title: "Title", description: "This is a description")
            HeaderViewRegular(title: "Title2", description: "This is a description")
            
            HeaderViewGeneric(title: "Title 3") {
                Text("Description")
            }
            Spacer()
        }
    }
}

#Preview {
    ViewBuilderSample()
}
