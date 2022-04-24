//
//  SignInView.swift
//  Deals
//
//  Created by Bruno Guirra on 24/04/22.
//

import UIKit

class SignInView: UIView {
    
    private lazy var signInImageView: UIImageView = {
        let imageView = IllustrationImageView(imageName: "SignIn")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var signInTitle: UILabel = {
        let label = UILabel()
        
        label.text = "Wecolme back"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = UIColor(named: "SecondaryAccentColor")
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var emailTextField: EmailTextField = {
        let textField = EmailTextField(symbolName: "envelope.circle", placeholderText: "Enter your email")
                
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var passwordTextField: PasswordTextField = {
        let textField = PasswordTextField(placeholderText: "Enter yoru password")
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Layout and Style

extension SignInView {
    
    func setUp() {
        style()
        layout()
        configConstraints()
    }
    
    func style() {
        self.backgroundColor = .systemBackground
    }
    
    func layout() {
        addSubview(signInImageView)
        addSubview(signInTitle)
        addSubview(emailTextField)
        addSubview(passwordTextField)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            // Sign In Image
            signInImageView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 3),
            signInImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
            trailingAnchor.constraint(equalToSystemSpacingAfter: signInImageView.trailingAnchor, multiplier: 3),
            
            // Sign Title
            signInTitle.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: signInImageView.bottomAnchor, multiplier: 8),
            signInTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // EmailTextField
            emailTextField.topAnchor.constraint(equalToSystemSpacingBelow: signInTitle.bottomAnchor, multiplier: 8),
            emailTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
            trailingAnchor.constraint(equalToSystemSpacingAfter: emailTextField.trailingAnchor, multiplier: 3),
            
            // PasswordTextField
            passwordTextField.topAnchor.constraint(equalToSystemSpacingBelow: emailTextField.bottomAnchor, multiplier: 3),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
        ])
    }
}
