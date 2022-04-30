//
//  AppDelegate.swift
//  Viper Sample
//
//  Created by Alberto Lourenço on 28/09/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: HomeRouter().viewController)
        window?.makeKeyAndVisible()
        
        return true
    }
}

