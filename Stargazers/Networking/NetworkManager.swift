//
//  NetworkManager.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 14/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import Foundation

class NetworkManager {
    
    let baseURL = "https://api.github.com/"
    
    func performRequest<ResponseType>(request: RequestProtocol, withReponse: @escaping (Result<ResponseType, RequestError>)->()) {
        guard let requestURL = URL(string: baseURL + request.requestPath()) else {
            withReponse(.failure(.domainError))
            return
        }
        
        
        var requestObject = URLRequest(url: requestURL)
        requestObject.httpBody = request.dictionaryForm().toData()
        requestObject.httpMethod = request.requestMethodType().rawValue
        
        let task = URLSession.shared.dataTask(with: requestObject) { (data, responseURL, error) in
            guard let _ = error else {
                withReponse(.failure(.domainError))
                return
            }
            
            guard let httpResponse = responseURL as? HTTPURLResponse,
                200..<299 ~= httpResponse.statusCode else {
                withReponse(.failure(.invalidResponse))
                return
            }
            
            guard let response = httpResponse as? ResponseType else {
                withReponse(.failure(.decodingError))
                return
            }
            
            withReponse(.success(response))
        }
        
        task.resume()
    }
}
