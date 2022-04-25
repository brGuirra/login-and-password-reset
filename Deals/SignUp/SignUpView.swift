//
//  SignUpView.swift
//  Deals
//
//  Created by Bruno Guirra on 24/04/22.
//

import UIKit

class SignUpView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Sign Up"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var formStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 24
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var nameTextField: EmailTextField = {
        let textField = EmailTextField(symbolName: "person.circle", placeholderText: "Enter your name")
        
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var emailTextField: EmailTextField = {
        let textField = EmailTextField(symbolName: "envelope.circle", placeholderText: "Enter your email")
        
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var passwordTextField: PasswordTextField = {
        let textField = PasswordTextField(placeholderText: "Enter your password")
        
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var confirmationPasswordTextField: PasswordTextField = {
        let textField = PasswordTextField(placeholderText: "Confirm your password")
        
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var passwordCriteriaStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        stackView.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var lengthCriteriaView: PasswordCriteriaView = {
        let lengthCriteriaView = PasswordCriteriaView(criteriaText: "8-32 characters without spaces")
        
        lengthCriteriaView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        lengthCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        return lengthCriteriaView
    }()
    
    private lazy var criteriaLabel: UILabel = {
        let label = UILabel()
        
        label.attributedText = makeCriteriaMessage()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var uppercaseCriteriaView: PasswordCriteriaView = {
        let uppercaseCriteriaView = PasswordCriteriaView(criteriaText: "Uppercase letter (A - Z)")
        
        uppercaseCriteriaView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uppercaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        return uppercaseCriteriaView
    }()
    
    private lazy var lowercaseCriteriaView: PasswordCriteriaView = {
        let lowercaseCriteriaView = PasswordCriteriaView(criteriaText: "Lowercase letter (a - z)")
        
        lowercaseCriteriaView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        lowercaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        return lowercaseCriteriaView
    }()
    
    private lazy var digitCriteriaView: PasswordCriteriaView = {
        let digitCriteriaView = PasswordCriteriaView(criteriaText: "Number (0 - 9)")
        
        digitCriteriaView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        digitCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        return digitCriteriaView
    }()
    
    private lazy var specialCharacterCriteriaView: PasswordCriteriaView = {
        let specialCharacterCriteriaView = PasswordCriteriaView(criteriaText: "Special character (e.g. !@#$%ˆ)")
        
        specialCharacterCriteriaView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        specialCharacterCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        return specialCharacterCriteriaView
    }()
    
    private lazy var registerButton: UIButton = {
        let button = CustomButton(text: "Register", color: "PrimaryAccentColor")
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var termsAndPrivacyLabel: UILabel = {
        let label = UILabel()
        
        label.attributedText = makeTermsAndPolicyMessage()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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

extension SignUpView {
    
    private func setUp() {
        style()
        layout()
        configConstraints()
    }
    
    private func style() {
        
        self.backgroundColor = .systemBackground
    }
    
    private func layout() {
        addSubview(titleLabel)
        addSubview(formStackView)
        
        formStackView.addArrangedSubview(nameTextField)
        formStackView.addArrangedSubview(emailTextField)
        formStackView.addArrangedSubview(passwordTextField)
        formStackView.addArrangedSubview(passwordCriteriaStackView)
        formStackView.addArrangedSubview(confirmationPasswordTextField)
        
        passwordCriteriaStackView.addArrangedSubview(lengthCriteriaView)
        passwordCriteriaStackView.addArrangedSubview(criteriaLabel)
        passwordCriteriaStackView.addArrangedSubview(uppercaseCriteriaView)
        passwordCriteriaStackView.addArrangedSubview(lowercaseCriteriaView)
        passwordCriteriaStackView.addArrangedSubview(digitCriteriaView)
        passwordCriteriaStackView.addArrangedSubview(specialCharacterCriteriaView)

        addSubview(registerButton)
        addSubview(termsAndPrivacyLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            // Title Label
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 8),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // Form StackView
            formStackView.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            formStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
            trailingAnchor.constraint(equalToSystemSpacingAfter: formStackView.trailingAnchor, multiplier: 3),
            
            // Register Button
            registerButton.leadingAnchor.constraint(equalTo: formStackView.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: formStackView.trailingAnchor),
            registerButton.topAnchor.constraint(equalToSystemSpacingBelow: formStackView.bottomAnchor, multiplier: 4),
            registerButton.heightAnchor.constraint(equalToConstant: 56),
            
            // Terms and Privacy Label
            termsAndPrivacyLabel.leadingAnchor.constraint(equalTo: formStackView.leadingAnchor),
            termsAndPrivacyLabel.trailingAnchor.constraint(equalTo: formStackView.trailingAnchor),
            termsAndPrivacyLabel.topAnchor.constraint(equalToSystemSpacingBelow: registerButton.bottomAnchor, multiplier: 2),
        ])
    }
    
    private func makeCriteriaMessage() -> NSAttributedString {
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .footnote)
        plainTextAttributes[.foregroundColor] = UIColor.label
        
        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.font] = UIFont.systemFont(ofSize: 13, weight: .bold)
        boldTextAttributes[.foregroundColor] = UIColor(named: "PrimaryAccentColor")
        
        let attrText = NSMutableAttributedString(string: "The password must meet ", attributes: plainTextAttributes)
        attrText.append(NSAttributedString(string: "at least 3 of 4 ", attributes: boldTextAttributes))
        attrText.append(NSAttributedString(string: "criteria listed below:", attributes: plainTextAttributes))
                
        return attrText
    }
    
    private func makeTermsAndPolicyMessage() -> NSAttributedString {
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .footnote)
        plainTextAttributes[.foregroundColor] = UIColor.label
        
        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.font] = UIFont.systemFont(ofSize: 13, weight: .bold)
        boldTextAttributes[.foregroundColor] = UIColor(named: "PrimaryAccentColor")
        
        let attrText = NSMutableAttributedString(string: "By clicking on register you agree with our ", attributes: plainTextAttributes)
        attrText.append(NSAttributedString(string: "Terms & Conditions ", attributes: boldTextAttributes))
        attrText.append(NSAttributedString(string: "and ", attributes: plainTextAttributes))
        attrText.append(NSAttributedString(string: "Privacy Policy.", attributes: boldTextAttributes))
        
        return attrText
    }
}
