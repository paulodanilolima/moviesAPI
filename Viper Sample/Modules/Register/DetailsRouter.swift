//
//  RegisterRouter.swift
//  Viper Sample
//
//  Created by Alberto Lourenço on 28/09/21.
//

import UIKit

final class DetailsRouter: BaseRouter {
    
    override init() {
        super.init()
        
        storyboard = UIStoryboard(name: "Details", bundle: nil)
        
        if let controller = storyboard.instantiateViewController(withIdentifier: "DetailsView") as? DetailsViewController {
            controller.presenter = DetailsPresenter(delegate: controller)
            
            viewController = controller
        }
    }
    
    override func showDetails(_ type: NavigationType = .push, data: results) {
        
        (self.viewController as? DetailsViewController)?.presenter.movies = data
        super.show()
    }
}
