//
//  HomeManager.swift
//  Viper Sample
//
//  Created by Alberto Lourenço on 28/09/21.
//

import Foundation

final class HomeManager: BaseManager {
    func loadMovies(_ completion: @escaping (_ result: MovieData?) -> Void) {
        
        super.request(method: .get,
                      endpoint: "",
                      responseType: MovieData.self) { response, code in
            
            if let object = response, code == 200 {
                completion(object)
            }else{
                completion(nil)
            }
        }
    }
}
