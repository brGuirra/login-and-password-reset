//
//  SignInViewController.swift
//  Deals
//
//  Created by Bruno Guirra on 24/04/22.
//

import UIKit

class SignInViewController: UIViewController {

    private let signInView: SignInView = {
        let view = SignInView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = signInView
    }
}
