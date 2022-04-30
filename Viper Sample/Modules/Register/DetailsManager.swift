//
//  RegisterManager.swift
//  Viper Sample
//
//  Created by Alberto Lourenço on 28/09/21.
//

import Foundation

final class DetailsManager: BaseManager  {
    
    func loadMovie(data: results,_ completion: @escaping (_ result: MovieData?) -> Void) {
        
        super.request(method: .get,
                      endpoint: "&query="+data.original_title.replacingOccurrences(of: " ", with: "+"),
                      responseType: MovieData.self) { response, code in
            
            if let object = response, code == 200 {
                completion(object)
            }else{
                completion(nil)
            }
        }
    }
    
}
