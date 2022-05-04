//
//  SignUpViewController.swift
//  Deals
//
//  Created by Bruno Guirra on 24/04/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let signUpModel = SignUpModel()

    private let signUpView: SignUpView = {
        let view = SignUpView()
        
        return view
    }()
    
    override func loadView() {
        view = signUpView
        
        signUpView.delegate = self
    }
}

extension SignUpViewController: SignUpViewDelegate {
    
    func nameValidation(name: String) {
        let result = signUpModel.isNameValid(name)
        
        if let error = result.1 {
            signUpView.displayErrorMessage(target: .name, message: error.message)
            return
        }
    }
    
    func emailValidation(email: String) {
       let result = signUpModel.isEmailValid(email)
        
        if let error = result.1 {
            signUpView.displayErrorMessage(target: .email, message: error.message)
        }
    }
    
    func inlinePasswordValidation(password: String) {
        let result = signUpModel.isCriteriaMet(password)
        
        signUpView.updateCriteriaStatus(with: result, type: .inline)
    }
    
    func lossOfFocusPasswordValidation(password: String) {
        let result = signUpModel.isPasswordValid(password)
        
        if let error = result.error {
            signUpView.displayErrorMessage(target: .password, message: error.message)
        }
        
        signUpView.updateCriteriaStatus(with: result.criteriaValidation, type: .lossOfFocus)        
    }
    
    func confirmationPasswordValidation(password: String, confirmationPassword: String) {
        let result = signUpModel.isConfirmationPasswordValid(password, confirmationPassword)
        
        if let error = result.1 {
            signUpView.displayErrorMessage(target: .password, message: error.message)
            signUpView.displayErrorMessage(target: .confirmationPassword, message: error.message)
        }
    }
}
