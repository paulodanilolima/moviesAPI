//
//  HomeRouter.swift
//  Viper Sample
//
//  Created by Alberto Lourenço on 28/09/21.
//

import UIKit

final class HomeRouter: BaseRouter {
    
    override init() {
        super.init()
        
        storyboard = UIStoryboard(name: "Home", bundle: nil)
        
        if let controller = storyboard.instantiateViewController(withIdentifier: "HomeView") as? HomeViewController {
            controller.presenter = HomePresenter(delegate: controller)
            
            viewController = controller
        }
    }
}
