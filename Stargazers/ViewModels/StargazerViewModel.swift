//
//  StargazerViewModel.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 15/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import Foundation

struct StargazerViewModel {
    
    private let stargazer: Stargazer
    
    var username: String {
        return self.stargazer.username ?? ""
    }
    
    var avatarURL: String {
        return self.stargazer.avatarURL ?? ""
    }
    
    var profileWeblink: String {
        return self.stargazer.profileWeblink ?? ""
    }
    
    init(_ stargazer: Stargazer) {
        self.stargazer = stargazer
    }
}

 
