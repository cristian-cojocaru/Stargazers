//
//  RequestProtocol.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 14/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import Foundation

enum RequestMethodType: String{
    case GET
    case POST
    case DELETE
    case PUT
    case PATCH
}

protocol RequestProtocol {
    
    func responseClass() -> BaseResponse.Type
    func requestPath() -> String
    func dictionaryForm() -> [String: Any]?
    func requestMethodType() -> RequestMethodType
}
