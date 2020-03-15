//
//  Stargazer.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 15/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import Foundation

class Stargazer: Decodable {
    var username: String?
    var avatarURL : String?
    
    enum CodingKeys:String, CodingKey {
        case name = "login"
        case avatarUrl = "avatar_url"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.username = try container.decodeIfPresent(String.self, forKey: .name)
        self.avatarURL = try container.decodeIfPresent(String.self, forKey: .avatarUrl)
    }
}
