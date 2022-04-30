//
//  RegisterPresenter.swift
//  Viper Sample
//
//  Created by Alberto Lourenço on 28/09/21.
//

import Foundation

protocol DetailsPresenterDelegate: BasePresenterDelegate {
    func loadedData()
}

final class DetailsPresenter: BasePresenter {
    
    var movies: results?
    var data: MovieData?
    
    
    func loadData(data: results) {
        
        DetailsManager().loadMovie(data: data) { result in
            
            self.data = result
            
            self.delegate.loadedData()
        }
    }
}
