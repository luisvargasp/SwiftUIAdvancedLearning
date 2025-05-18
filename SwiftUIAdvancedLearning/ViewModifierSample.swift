//
//  ViewModifierSample.swift
//  SwiftUIAdvancedLearning
//
//  Created by FerVP on 18/05/25.
//

import SwiftUI

struct DefaulButtonViewModifier : ViewModifier {
    
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(25)
            .clipShape(.rect)
            .shadow(radius: 10)
    }
    
    
}
extension View {
    
    
    func withDefaulButtonStyle() -> some View {
        self.modifier(DefaulButtonViewModifier())
    }
}

struct ViewModifierSample: View {
    var body: some View {
        VStack (spacing : 10 ){
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .modifier(DefaulButtonViewModifier())
            
            Text("See the difference")
                .font(.headline)
                .withDefaulButtonStyle()
            
                
            
        }.padding()
    }
}

#Preview {
    ViewModifierSample()
}
