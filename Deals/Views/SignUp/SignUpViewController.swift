//
//  SignUpViewController.swift
//  Deals
//
//  Created by Bruno Guirra on 24/04/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let appModel = AppModel()

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
    
    func validatePassword(_ password: String) {
        let result = appModel.isPasswordValid(password)
        
        signUpView.updateCriteriaStatus(with: result)
    }
}
