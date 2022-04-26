//
//  AppDelegate.swift
//  Deals
//
//  Created by Bruno Guirra on 23/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let navigationVC = UINavigationController(rootViewController: HomeViewController())
        window?.rootViewController = navigationVC
        
        let config = UIImage.SymbolConfiguration(pointSize: 32)
        let backButtonImage = UIImage(systemName: "arrow.turn.up.left", withConfiguration: config)
        
        navigationVC.navigationBar.backIndicatorImage = backButtonImage
        navigationVC.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        navigationVC.navigationBar.topItem?.backButtonTitle = ""
        navigationVC.navigationBar.tintColor = .label
        
        return true
    }
}
