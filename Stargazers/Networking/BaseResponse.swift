//
//  BaseReponse.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 14/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import Foundation

class BaseResponse {
    var status : String?
    var statusCode : Int?
    var errorMessage: String?

    
    required init(data:Data) {
        print("base reponse init called...")
    }
}
