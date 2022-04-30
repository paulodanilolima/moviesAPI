//
//  BasePresenter.swift
//  Viper Sample
//
//  Created by Alberto Lourenço on 28/09/21.
//

import Foundation

protocol BasePresenterDelegate {
    func loadedData()
}

class BasePresenter {
    
    var delegate: BasePresenterDelegate!
    
    init(delegate: BasePresenterDelegate) {
        self.delegate = delegate
    }
}
