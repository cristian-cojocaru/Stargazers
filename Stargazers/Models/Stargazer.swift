//
//  Stargazer.swift
//  Stargazers
//  
//  Created by Cristian Cojocaru on 15/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//


class Stargazer: Decodable {

    var username: String?
    var avatarURL : String?
    var profileWeblink: String?
    
    enum CodingKeys:String, CodingKey {
        case name = "login"
        case avatarURL = "avatar_url"
        case profileWeblink = "html_url"
    }
    
    internal init(username: String?, avatarURL: String?, profileWeblink: String?) {
        self.username = username
        self.avatarURL = avatarURL
        self.profileWeblink = profileWeblink
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.username = try container.decodeIfPresent(String.self, forKey: .name)
        self.avatarURL = try container.decodeIfPresent(String.self, forKey: .avatarURL)
        self.profileWeblink = try container.decodeIfPresent(String.self, forKey: .profileWeblink)
    }
}
