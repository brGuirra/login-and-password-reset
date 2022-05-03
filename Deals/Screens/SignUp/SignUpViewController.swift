//
//  SignUpViewController.swift
//  Deals
//
//  Created by Bruno Guirra on 24/04/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let appModel = SignUpModel()

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
    
    func validatePasswordCriteria(_ password: String) {
        let result = appModel.isCriteriaMet(password)
        
        signUpView.updateCriteriaStatus(with: result)
    }
    
    func validatePassword(_ password: String) {

    }
}
