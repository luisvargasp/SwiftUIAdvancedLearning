//
//  GeometryPreferenceKey.swift
//  SwiftUIAdvancedLearning
//
//  Created by FerVP on 21/05/25.
//

import SwiftUI

struct GeometryPreferenceKey: View {
    
    @State var rectSize: CGSize = .zero
    var body: some View {
        VStack{
            Text("Hello World")
                .frame(width: rectSize.width, height: rectSize.height)
                .background(Color.blue)
                .clipped()
            Spacer()
            HStack{
                Rectangle()
                GeometryReader{
                    geo in
                    Rectangle()
                        .updateRectangleGeometrySize(geo.size)

                }
                Rectangle()
               
            }.frame(height: 120)
        }.onPreferenceChange(RectangleGeometrySizePreferenceKey.self){ value in
            rectSize = value
            
        }
    }
}

#Preview {
    GeometryPreferenceKey()
}

struct RectangleGeometrySizePreferenceKey : PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
    
    
}

extension View {
    func updateRectangleGeometrySize(_ size: CGSize) -> some View {
        preference(key: RectangleGeometrySizePreferenceKey.self, value: size )
    }
}
