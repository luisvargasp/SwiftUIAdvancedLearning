//
//  AnyTransitionSample.swift
//  SwiftUIAdvancedLearning
//
//  Created by FerVP on 18/05/25.
//

import SwiftUI

struct RotateViewModifier : ViewModifier {
    
    let rotation : Double
   func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(rotation))
            .offset(x : rotation != 0 ? 100 : 0, y : rotation != 0 ? 100 : 0)
    }
    
    
}
extension AnyTransition {
     static var rotating  : AnyTransition {
         return AnyTransition.modifier(active: RotateViewModifier(rotation: 0), identity: RotateViewModifier(rotation:360))
        
    }
}

struct AnyTransitionSample: View {
    @State var showRectangle : Bool = false
    var body: some View {
        VStack{
            Spacer()
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                              .frame(width: 250, height: 300)
                              .frame(maxWidth: .infinity)
                            
                              .transition(.rotating)

            }
          
            Spacer()
            Text("Click me")
                .withDefaulButtonStyle()
                .padding()
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showRectangle.toggle()
                        
                    }
                    
                }
          
        }
    }
}

#Preview {
    AnyTransitionSample()
}
