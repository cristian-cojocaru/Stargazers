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
    
    func performRequest(request: RequestProtocol, withReponse: @escaping (Result<BaseResponse, RequestError>)->()) {
        guard let requestURL = URL(string: baseURL + request.requestPath()) else {
            withReponse(.failure(.domainError))
            return
        }
        
        var requestObject = URLRequest(url: requestURL)
        requestObject.httpMethod = request.requestMethodType().rawValue
        if let dict = request.dictionaryForm(),
            let body = dict.toData() {
               requestObject.httpBody = body
        }
        
        
        let task = URLSession.shared.dataTask(with: requestObject) { (data, responseURL, error) in
            
            guard error == nil else {
                withReponse(.failure(.domainError))
                return
            }
            
            guard let httpResponse = responseURL as? HTTPURLResponse,
                200..<299 ~= httpResponse.statusCode else {
                withReponse(.failure(.invalidResponse))
                return
            }
            
            
            guard let data = data else {
                withReponse(.failure(.invalidResponse))
                return
            }
            
            let baseResponse =  request.responseClass().init(data: data)
            baseResponse.statusCode = httpResponse.statusCode
            withReponse(.success(baseResponse))
            
        }
        
        task.resume()
    }
}
