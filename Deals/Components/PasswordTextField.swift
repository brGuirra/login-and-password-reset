//
//  PasswordTextField.swift
//  Deals
//
//  Created by Bruno Guirra on 24/04/22.
//

import UIKit

class PasswordTextField: UIView {
    
    private let placeholderText: String
    
    private lazy var symbolImageView: UIImageView = {
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 32)
        
        imageView.image = UIImage(systemName: "lock.circle", withConfiguration: config)
        imageView.tintColor = .quaternaryLabel
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        
        textField.isSecureTextEntry = false
        textField.textColor = .label
        textField.placeholder = placeholderText
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.tertiaryLabel])
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var dividerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .quaternaryLabel
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var eyeButton: UIButton = {
        let button = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        let normalImage = UIImage(systemName: "eye.slash.fill", withConfiguration: config)
        let selectedImage = UIImage(systemName: "eye.fill", withConfiguration: config)
        
        button.setImage(normalImage, for: .normal)
        button.setImage(selectedImage, for: .selected)
        button.imageView?.tintColor = .quaternaryLabel
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    init(placeholderText: String) {
        self.placeholderText = placeholderText
        
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 50)
    }
}

//MARK: - Layout and Style

extension PasswordTextField {
    
    private func setupView() {
        layout()
        configConstraints()
    }
    
    private func layout() {
        addSubview(symbolImageView)
        addSubview(textField)
        addSubview(eyeButton)
        addSubview(dividerView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            // Symbol ImageView
            symbolImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            // TextField
            textField.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: symbolImageView.trailingAnchor, multiplier: 1),
            
            // Eye Button
            eyeButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            eyeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1),
            eyeButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // DividerView
            dividerView.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1),
            dividerView.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: eyeButton.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 2),
        ])
    }
}

