//
//  CustomTextField.swift
//  Deals
//
//  Created by Bruno Guirra on 24/04/22.
//

import UIKit

protocol TextFieldComponentDelegate: AnyObject {
    
    func didFinishTyping(_ sender: TextFieldComponent, text: String?) -> Void
}

class TextFieldComponent: UIView {

    weak var delegate: TextFieldComponentDelegate?
    
    private let symbolName: String
    private let placeholderText: String
    private let capitalizationType: UITextAutocapitalizationType
    
    private lazy var symbolImageView: UIImageView = {
        let imageView = UIImageView()
        let config = UIImage.SymbolConfiguration(pointSize: 32)
        
        imageView.image = UIImage(systemName: symbolName, withConfiguration: config)
        imageView.tintColor = .quaternaryLabel
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        
        textField.delegate = self
        textField.isSecureTextEntry = false
        textField.textColor = .label
        textField.autocapitalizationType = capitalizationType
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
    
    init(symbolName: String, placeholderText: String, capitalizationType: UITextAutocapitalizationType) {
        self.symbolName = symbolName
        self.placeholderText = placeholderText
        self.capitalizationType = capitalizationType
        
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

extension TextFieldComponent {
    
    private func setupView() {
        layout()
        configConstraints()
    }
    
    private func layout() {
        addSubview(symbolImageView)
        addSubview(textField)
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
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // DividerView
            dividerView.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1),
            dividerView.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 2),
        ])
    }
}

//MARK: - UITextFieldDelegate

extension TextFieldComponent: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.didFinishTyping(self, text: textField.text)
    }
}
