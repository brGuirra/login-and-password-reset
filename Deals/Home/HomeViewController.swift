//
//  ViewController.swift
//  Deals
//
//  Created by Bruno Guirra on 23/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeView: HomeView = {
       let view = HomeView()
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = homeView
    }
}

