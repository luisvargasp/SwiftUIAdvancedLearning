//
//  ButtonStyleSample.swift
//  SwiftUIAdvancedLearning
//
//  Created by FerVP on 18/05/25.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .opacity(configuration.isPressed ? 0.8 : 1)
            .brightness(configuration.isPressed ? 0.05 : 0)
            
    }
}
extension View {
    func withPressableButtonStyle() -> some View {
        self.buttonStyle(PressableButtonStyle())
    }
}

struct ButtonStyleSample: View {
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Text("TAP ME")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 5)
            }
            .buttonStyle(PressableButtonStyle())
            
            Button {
                
            } label: {
                Text("TAP ME")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 5)
            }.withPressableButtonStyle()
        }

    }
}

#Preview {
    ButtonStyleSample()
}
