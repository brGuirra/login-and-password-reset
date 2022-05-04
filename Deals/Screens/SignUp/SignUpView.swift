//
//  SignUpView.swift
//  Deals
//
//  Created by Bruno Guirra on 24/04/22.
//

import UIKit

enum FormTarget {
    case name
    case email
    case password
    case confirmationPassword
}

enum ValidationType {
    case inline
    case lossOfFocus
}

protocol SignUpViewDelegate: AnyObject {
    func inlinePasswordValidation(password: String) -> Void
    func lossOfFocusPasswordValidation(password: String) -> Void
    func nameValidation(name: String) -> Void
    func emailValidation(email: String) -> Void
    func confirmationPasswordValidation(password: String, confirmationPassword: String) -> Void
}

class SignUpView: UIView {
    
    weak var delegate: SignUpViewDelegate?
    
    
    
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
        stackView.spacing = 32
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var nameTextField: TextFormFieldComponent = {
        let textField = TextFormFieldComponent(symbolName: "person.circle", placeholderText: "Enter your name", capitalizationType: .words)
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var emailTextField: TextFormFieldComponent = {
        let textField = TextFormFieldComponent(symbolName: "envelope.circle", placeholderText: "Enter your email", capitalizationType: .none)
        
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var passwordTextField: PasswordFormFieldComponent = {
        let textField = PasswordFormFieldComponent(placeholderText: "Enter your password")
        
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var passwordCriteriaStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 0)
        
        stackView.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var lengthCriteriaView: PasswordCriteriaComponent = {
        let lengthCriteriaView = PasswordCriteriaComponent(criteriaText: "8-32 characters without spaces")
        
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
    
    private lazy var uppercaseCriteriaView: PasswordCriteriaComponent = {
        let uppercaseCriteriaView = PasswordCriteriaComponent(criteriaText: "Uppercase letter (A - Z)")
        
        uppercaseCriteriaView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uppercaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        return uppercaseCriteriaView
    }()
    
    private lazy var lowercaseCriteriaView: PasswordCriteriaComponent = {
        let lowercaseCriteriaView = PasswordCriteriaComponent(criteriaText: "Lowercase letter (a - z)")
        
        lowercaseCriteriaView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        lowercaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        return lowercaseCriteriaView
    }()
    
    private lazy var digitCriteriaView: PasswordCriteriaComponent = {
        let digitCriteriaView = PasswordCriteriaComponent(criteriaText: "Number (0 - 9)")
        
        digitCriteriaView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        digitCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        return digitCriteriaView
    }()
    
    private lazy var specialCharacterCriteriaView: PasswordCriteriaComponent = {
        let specialCharacterCriteriaView = PasswordCriteriaComponent(criteriaText: "Special character, e.g: .,@:?!()$\\/#)")
        
        specialCharacterCriteriaView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        specialCharacterCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        return specialCharacterCriteriaView
    }()
    
    private lazy var confirmationPasswordTextField: PasswordFormFieldComponent = {
        let textField = PasswordFormFieldComponent(placeholderText: "Confirm your password")
        
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton.createCustomButton(text: "Register", color: UIColor(named: "Blue"))
        
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
        
        setupView()
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmationPasswordTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Layout and Style

extension SignUpView {
    
    private func setupView() {
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
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 12),
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
        boldTextAttributes[.foregroundColor] = UIColor(named: "Blue")
        
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
        boldTextAttributes[.foregroundColor] = UIColor(named: "Blue")
        
        let attrText = NSMutableAttributedString(string: "By clicking on register you agree with our ", attributes: plainTextAttributes)
        attrText.append(NSAttributedString(string: "Terms & Conditions ", attributes: boldTextAttributes))
        attrText.append(NSAttributedString(string: "and ", attributes: plainTextAttributes))
        attrText.append(NSAttributedString(string: "Privacy Policy.", attributes: boldTextAttributes))
        
        return attrText
    }
}

//MARK: - FormFieldDelegate

extension SignUpView: FormFieldDelegate {
    
    func didStartTyping(_ sender: FormField, text: String?) {
        guard let text = text else {
            return
        }
        
        switch sender {
            case nameTextField:
                nameTextField.clearError()
            case emailTextField:
                emailTextField.clearError()
            case passwordTextField:
                passwordTextField.clearError()
                delegate?.inlinePasswordValidation(password: text)
            case confirmationPasswordTextField:
                confirmationPasswordTextField.clearError()
            default:
                return
        }
    }
    
    func didFinishTyping(_ sender: FormField, text: String?) {
        guard let text = text else {
            return
        }
        
        switch sender {
            case nameTextField:
                delegate?.nameValidation(name: text)
            case emailTextField:
                delegate?.emailValidation(email: text)
            case passwordTextField:
                delegate?.lossOfFocusPasswordValidation(password: text)
            case confirmationPasswordTextField:
                guard let password = passwordTextField.text else { return }
                delegate?.confirmationPasswordValidation(password: password, confirmationPassword: text)
            default:
                return
        }
    }
}

//MARK: - Actions

extension SignUpView {
    
    func updateCriteriaStatus(with result: PasswordCriteriaValidationResult, type: ValidationType) {
        
        switch type {
            case .inline:
                passwordTextField.clearError()
                
                result.legthAndNoSpaceMet
                ? lengthCriteriaView.isCriteriaMet = true
                : lengthCriteriaView.reset()
                
                result.lowercaseMet
                ? lowercaseCriteriaView.isCriteriaMet = true
                : lowercaseCriteriaView.reset()
                
                result.uppercaseMet
                ? uppercaseCriteriaView.isCriteriaMet = true
                : uppercaseCriteriaView.reset()
                
                result.digitMet
                ? digitCriteriaView.isCriteriaMet = true
                : digitCriteriaView.reset()
                
                result.specialCharacterMet
                ? specialCharacterCriteriaView.isCriteriaMet = true
                : specialCharacterCriteriaView.reset()
            case .lossOfFocus:
                lengthCriteriaView.isCriteriaMet = result.legthAndNoSpaceMet
                lowercaseCriteriaView.isCriteriaMet = result.lowercaseMet
                uppercaseCriteriaView.isCriteriaMet = result.uppercaseMet
                digitCriteriaView.isCriteriaMet = result.digitMet
                specialCharacterCriteriaView.isCriteriaMet = result.specialCharacterMet
        }
    }
    
    func displayErrorMessage(target: FormTarget, message: String) {
        switch target {
            case .password:
                passwordTextField.showError(message)
            case .name:
                nameTextField.showError(message)
            case .email:
                emailTextField.showError(message)
            case .confirmationPassword:
                confirmationPasswordTextField.showError(message)
        }
    }
}
