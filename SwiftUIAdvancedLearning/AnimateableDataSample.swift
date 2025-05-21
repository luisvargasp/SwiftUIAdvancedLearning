//
//  AnimateableDataSample.swift
//  SwiftUIAdvancedLearning
//
//  Created by FerVP on 21/05/25.
//

import SwiftUI

struct AnimateableDataSample: View {
    @State var animate : Bool = false
    var body: some View {
        ZStack{
//            RoundedRectangle(cornerRadius: animate ? 60 : 10)
           // RectangleSingleRoundedCorner(cornerRadius: animate ? 60 : 20)
            Pacman(offset: animate ? 20 : 0)
                .frame(width: 200, height: 200)
            
        }.onAppear {
            withAnimation(.easeInOut(duration: 1).repeatForever()){
                animate.toggle()
                
                
            }
        }
    }
}

#Preview {
    AnimateableDataSample()
}

struct RectangleSingleRoundedCorner : Shape {
    
    var cornerRadius: CGFloat
    var animatableData: CGFloat {
        get{
            cornerRadius
        }
        set{
            cornerRadius = newValue
            
        }
    }
    func path(in rect: CGRect) -> Path {
        Path{path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY-cornerRadius))
            
            path.addArc(center: CGPoint(x: rect.maxX-cornerRadius, y: rect.maxY-cornerRadius),
                        radius: cornerRadius,
                        startAngle: .zero,
                        endAngle: Angle(degrees: 180),
                        clockwise: false)
            
            
            path.addLine(to: CGPoint(x: rect.maxX-cornerRadius, y: rect.maxY))
            
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            
        }
    }
}

struct Pacman : Shape {
    
    var offset : Double
    var animatableData: Double{
        get {
            offset
        }
        set {
            offset = newValue
        }
    }
    func path(in rect: CGRect) -> Path {
        Path{path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.minY),
                        radius: rect.height/2,
                        startAngle: Angle(degrees: offset),
                        endAngle: Angle(degrees: 360 - offset),
                        clockwise: false)
            
        }
    }
}
