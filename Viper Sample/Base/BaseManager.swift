//
//  BaseManager.swift
//  Viper Sample
//
//  Created by Alberto Lourenço on 30/09/21.
//

import Foundation

class BaseManager {
    
    func request<T:Decodable>(method: RequestType,
                              endpoint: String,
                              parameters: Dictionary<String, Any> = [:],
                              responseType: T.Type,
                              completion: @escaping (_ response: T?, _ code: Int) -> Void) {
        
        var serverURL: String = Constants.API.BaseURL + endpoint
        
        if endpoint != "" {
            serverURL = Constants.API.BaseSearch + endpoint
        }
        
        let request = NSMutableURLRequest(url: URL(string: serverURL)!)
        request.timeoutInterval = 10
        request.cachePolicy = .useProtocolCachePolicy
        request.setValue("*/*", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        switch method {
            case .get:
                request.httpMethod = "GET"
                break
            case .post:
                request.httpMethod = "POST"
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                break
        }
        
        print("------------------------------------------------------------------")
        print("Parameters: \(parameters)")
        print("Request URL: \(request.url!.absoluteString)")
        print("------------------------------------------------------------------")
        
        //---------------------------------------------------------
        //  Load API
        //---------------------------------------------------------
        
        DispatchQueue.global().async {
            let task = session.dataTask(with: request as URLRequest,
                                        completionHandler: {data, response, error -> Void in
                DispatchQueue.main.async {
                    let responseCode = response?.getStatusCode() ?? 0
                    if let responseData = data, responseData.count != 0 {
                        do {
                            let parse = try JSONDecoder().decode(T.self, from: responseData)
                            completion(parse, responseCode)
                        }catch{
                            print(error)
                            completion(nil, responseCode)
                        }
                    }else{
                        completion(nil, responseCode)
                    }
                }
            })
            task.resume()
        }
    }
}
