//
//  CustomTextField.swift
//  Deals
//
//  Created by Bruno Guirra on 24/04/22.
//

import UIKit

class TextFormFieldComponent: FormField {
    
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
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.textColor = .systemPink
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.isHidden = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
    
    func showError(message: String) {
        errorLabel.isHidden = false
        errorLabel.text = message
    }
    
    func clearError() {
        errorLabel.isHidden = true
        errorLabel.text = ""
    }
}

//MARK: - Layout and Style

extension TextFormFieldComponent {
    
    private func setupView() {
        layout()
        configConstraints()
    }
    
    private func layout() {
        addSubview(symbolImageView)
        addSubview(textField)
        addSubview(dividerView)
        addSubview(errorLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            // Symbol ImageView
            symbolImageView.topAnchor.constraint(equalTo: topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            // TextField
            textField.topAnchor.constraint(equalTo: symbolImageView.topAnchor),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: symbolImageView.trailingAnchor, multiplier: 1),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // DividerView
            dividerView.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1),
            dividerView.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 2),
            
            //Error Label
            errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 1),
            errorLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
        ])
    }
}

//MARK: - UITextFieldDelegate

extension TextFormFieldComponent: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.didFinishTyping(self, text: textField.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true) // resign first reponder
        
        delegate?.didFinishTyping(self, text: textField.text)
        
        return true
    }
}
