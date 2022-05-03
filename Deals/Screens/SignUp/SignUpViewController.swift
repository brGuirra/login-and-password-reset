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
    
    func inlinePasswordValidation(password: String) {
        let result = signUpModel.isCriteriaMet(password)
        
        signUpView.updateCriteriaStatus(with: result, type: .inline)
    }
}
