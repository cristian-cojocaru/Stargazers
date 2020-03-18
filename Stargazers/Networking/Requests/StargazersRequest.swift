//
//  StargazersRequest.swift
//  Stargazers
//  
//  Created by Cristian Cojocaru on 14/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import Foundation

class StargazerRequest: RequestProtocol {

    var userName: String
    var repositoryName: String
    var page: Int
    
    init(userName: String, repositoryName: String, page: Int) {
        self.userName = userName
        self.repositoryName = repositoryName
        self.page = page
    }
    
    func responseClass() -> BaseResponse.Type {
        return StargazerResponse.self
    }
    
    func requestPath() -> String {
        return "repos/\(userName)/\(repositoryName)/stargazers?page=\(page)"
    }
    
    func dictionaryForm() -> [String : Any]? {
        return nil
    }
    
    func requestMethodType() -> RequestMethodType {
        return RequestMethodType.GET
    }
    
    func perform(completion: @escaping (StargazerResponse)->()) {
        NetworkManager().performRequest(request: self) { (result) in
            switch result {
            case .failure(.domainError):
                print("\(type(of: self)): domain error")
            case .failure(.decodingError):
                print("\(type(of: self)): decoding error")
            case .failure(.invalidResponse):
                print("\(type(of: self)): invalid error")
            case .failure(.networkError):
                print("\(type(of: self)): network error")
                
            case .success(let result) :
                guard let result = (result as? StargazerResponse) else {
                    return
                }
                
                completion(result)
            }
        }
    }
}


class StargazerResponse: BaseResponse {
    
    var stargazers = [Stargazer]()
    
    required init(data: Data) {
        super.init(data: data)
        guard let stargazers = data.toObject(of: [Stargazer].self) else {
            return
        }
        self.stargazers = stargazers
    }

}
