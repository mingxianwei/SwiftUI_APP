//
//  BlurView.swift
//  SwiftUIApp
//
//  Created by 明先伟 on 2022/10/17.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    

}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView(style: UIBlurEffect.Style(rawValue: 0)!)
    }
}
