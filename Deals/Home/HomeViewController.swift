//
//  ViewController.swift
//  Deals
//
//  Created by Bruno Guirra on 23/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func loadView() {
        view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let view = view as? HomeView else {
            fatalError("Couldn't typecast the View as instance of HomeView")
        }
        
        view.delegate = self
    }
}

//MARK: - HomeViewDelegate

extension HomeViewController: HomeViewDelegate {
    
    func goToSignIn() {
        let vc = SignInViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToSignUp() {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

