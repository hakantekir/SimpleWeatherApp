//
//  WidgetView.swift
//  SimpleWeatherApp
//
//  Created by Hakan Tekir on 28.05.2023.
//

import UIKit

class WidgetView: UIView {
    var radius: Int
    var borderWidth: Int
    var color: UIColor
    
    init(radius: Int, borderWidth: Int, color: UIColor) {
        self.radius = radius
        self.borderWidth = borderWidth
        self.color = color
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        layer.cornerRadius = CGFloat(radius)
        layer.borderWidth = CGFloat(borderWidth)
        layer.borderColor = color.cgColor
        backgroundColor = .clear
    }
}
