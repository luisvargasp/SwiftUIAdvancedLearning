//
//  MatchedGeometryEffectSample.swift
//  SwiftUIAdvancedLearning
//
//  Created by FerVP on 18/05/25.
//

import SwiftUI

struct MatchedGeometryEffectSample: View {
    @State var isClicked: Bool = false
    
    @Namespace var namespace
    var body: some View {
        VStack{
            if !isClicked{
                RoundedRectangle(cornerRadius: 25) .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width:100,height:100)
                
            }
            
            
            Spacer()
            if isClicked{
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width:300,height:200)
                
            }
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 1)){
                self.isClicked.toggle()
            }
        }
        .padding(.vertical,0.2)
        
    }
}

#Preview {
    MatchedGeometryEffectSample2()
}

struct MatchedGeometryEffectSample2: View {
    
    let categories: [String] =
    ["Home","Popular","New","Movies"]
    @State var selectedCategory: String = ""
    @Namespace var namespace
    
    var body: some View {
        HStack{
            ForEach(categories,id:\.self){
                c in
                ZStack {
                    if selectedCategory == c{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.5))
                            .matchedGeometryEffect(id: "background", in: namespace)
                            .frame(width:50,height:2)
                            .offset(y:10)
                    }
                    
                    Text(c)
                        .foregroundStyle(selectedCategory == c ? Color.red : Color.black)
                }.frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .onTapGesture {
                        withAnimation{
                            selectedCategory = c
                        }
                    }
                
            }
        }.padding()
    }
}
