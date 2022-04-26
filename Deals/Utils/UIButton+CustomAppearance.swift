//
//  UIButton+CustomAppearance.swift
//  Deals
//
//  Created by Bruno Guirra on 25/04/22.
//

import UIKit

extension UIButton {
    static func createCustomButton(text: String, color: UIColor?) -> UIButton {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 16
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.clipsToBounds = true
        button.backgroundColor = color
        
        return button
    }
}
