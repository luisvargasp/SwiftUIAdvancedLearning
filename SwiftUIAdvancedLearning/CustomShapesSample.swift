//
//  CustomShapesSample.swift
//  SwiftUIAdvancedLearning
//
//  Created by FerVP on 18/05/25.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
       Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.closeSubpath()
        }
    }
}
struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let hOffset: CGFloat = rect.width*0.2
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        
            path.addLine(to: CGPoint(x: rect.maxX-hOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX+hOffset, y: rect.midY))
            path.closeSubpath()

        }
    }
}

struct Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let hOffset: CGFloat = rect.width*0.25
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            
            path.addLine(to: CGPoint(x: rect.minX+hOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX-hOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.closeSubpath()
        }
    }
}

struct CustomShapesSample: View {
    var body: some View {
        ZStack{
            Trapezoid()
                .fill(Color.red)
                .frame(width: 300, height: 200)
        }
    }
}

#Preview {
    CustomShapesSample()
}
