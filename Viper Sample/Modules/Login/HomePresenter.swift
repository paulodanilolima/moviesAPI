//
//  HomePresenter.swift
//  Viper Sample
//
//  Created by Alberto Lourenço on 28/09/21.
//

import Foundation

protocol HomePresenterDelegate: BasePresenterDelegate {
    func loadedData()
}

final class HomePresenter: BasePresenter {
    
    var data: MovieData?

    func loadData() {
        
        HomeManager().loadMovies { result in
            
            self.data = result
            
            self.delegate.loadedData()
        }
    }
    
    func showDetails(_ object: MovieData, index: Int, data: results){
        DetailsRouter().showDetails(data: data)
    }
}
