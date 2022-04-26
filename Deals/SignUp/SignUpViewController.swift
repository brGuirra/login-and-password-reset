//
//  SignUpViewController.swift
//  Deals
//
//  Created by Bruno Guirra on 24/04/22.
//

import UIKit

class SignUpViewController: UIViewController {

    private let signUpView: SignUpView = {
        let view = SignUpView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = signUpView
    }
}
