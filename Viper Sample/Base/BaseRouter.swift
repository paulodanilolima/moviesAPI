//
//  BaseRouter.swift
//  Viper Sample
//
//  Created by Alberto Lourenço on 28/09/21.
//

import UIKit

enum NavigationType {
    case push
    case modal
}

class BaseRouter {
    
    var storyboard: UIStoryboard!
    var viewController: UIViewController!
    
    func show() {
        UIApplication.topViewController()?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func present() {
        let navController = UINavigationController(rootViewController: viewController)
        UIApplication.topViewController()?.present(navController, animated: true, completion: nil)
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Navigation
    //-----------------------------------------------------------------------
    
    func showLogin(_ type: NavigationType = .push) {
        
        if type == .push {
            HomeRouter().show()
        }else{
            HomeRouter().present()
        }
    }
    
    func showDetails(_ type: NavigationType = .push, data: results) {
        
        if type == .push {
            DetailsRouter().show()
        }else{
            DetailsRouter().present()
        }
    }
}
