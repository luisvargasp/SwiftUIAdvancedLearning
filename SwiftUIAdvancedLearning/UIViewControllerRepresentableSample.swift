//
//  UIViewControllerRepresentable.swift
//  SwiftUIAdvancedLearning
//
//  Created by FerVP on 22/05/25.
//

import SwiftUI

struct UIViewControllerRepresentableSample: View {
    @State var showScreen: Bool = false
    var body: some View {
        VStack {
            Button("ClickHere"){
                showScreen.toggle()
                
            }
            .sheet(isPresented: $showScreen, content: {
                BasicUIControllerRepresentable(labelText: "UIKIT LABEL")
            })
            
        }
       
    }
}

#Preview {
    UIViewControllerRepresentableSample()
}

struct BasicUIControllerRepresentable:UIViewControllerRepresentable {

    let labelText: String
    
    
    func makeUIViewController(context : Context) -> some UIViewController {
        let vc = MyFirstViewController()
        vc.labelText = "UIKIT LABEL"
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
        
    }
}

class MyFirstViewController: UIViewController {
    var labelText: String = "Starting"
    override func viewDidLoad() {
        view.backgroundColor = .systemBlue
        
        let label = UILabel()
        label.text = labelText
        label.textColor = UIColor.white
        label.frame = view.frame

        view.addSubview(label)
        
    }
}
