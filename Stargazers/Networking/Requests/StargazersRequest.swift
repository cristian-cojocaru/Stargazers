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
    
    init(userName: String, repositoryName: String) {
        self.userName = userName
        self.repositoryName = repositoryName
    }
    
    func responseClass() -> BaseResponse.Type {
        return StargazerResponse.self
    }
    
    func requestPath() -> String {
        return "repos/\(userName)/\(repositoryName)/stargazers"
    }
    
    func dictionaryForm() -> [String : Any] {
        return [:]
    }
    
    func requestMethodType() -> RequestMethodType {
        return RequestMethodType.GET
    }
    
    
}


class StargazerResponse: BaseResponse {
    
}
