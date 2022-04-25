//
//  CustomButton.swift
//  Deals
//
//  Created by Bruno Guirra on 23/04/22.
//

import UIKit

class CustomButton: UIButton {

    let text: String
    let color: String
    
    init(text: String, color: String) {
        self.text = text
        self.color = color
        
        super.init(frame: .zero)
        
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func style() {
        layer.cornerRadius = 16
        setTitle(text, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        clipsToBounds = true
        backgroundColor = UIColor(named: color)
    }
}
