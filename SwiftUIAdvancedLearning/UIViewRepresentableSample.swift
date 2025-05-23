//
//  UIViewRepresentableSample.swift
//  SwiftUIAdvancedLearning
//
//  Created by FerVP on 22/05/25.
//

import SwiftUI

struct BasicUIViewRepresentable : UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}
struct UITextFieldViewRepresentable: UIViewRepresentable {
    
    @Binding var text: String
    let placeholder: String
    let placeholderColor: UIColor
    func makeUIView(context: Context) ->  UITextField {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: placeholderColor])
        
        textField.delegate = context.coordinator
        
        
        return textField
    }
        //from swiftui to uikit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        
    }
    // from uikit to swiftui
    func makeCoordinator() ->Coordinator {
        return Coordinator(text: $text)
        
    }
    class Coordinator : NSObject, UITextFieldDelegate{
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
            
           
        }
        
    }
    
        
}

struct UIViewRepresentableSample: View {
    @State private var text = ""
    var body: some View {
        VStack {
            Text(text)
            HStack {
                Text("SwiftUI")
                TextField("Type here ...", text: $text)
                    .frame(height : 55)
                    .background(Color.gray)
                    .multilineTextAlignment(.center)
            }
            HStack{
                Text("UIKit")
            
                UITextFieldViewRepresentable(text: $text,placeholder: "Type here ...", placeholderColor: .blue)
                         .frame(height : 55)
                         .background(Color.gray)
            }
        
           // BasicUIViewRepresentable()
            
        }.ignoresSafeArea(edges : .bottom)
    }
}

#Preview {
    UIViewRepresentableSample()
}
