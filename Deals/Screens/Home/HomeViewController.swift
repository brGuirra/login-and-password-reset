//
//  ViewController.swift
//  Deals
//
//  Created by Bruno Guirra on 23/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView: HomeView = {
        let view = HomeView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = homeView
        
        homeView.delegate = self
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

