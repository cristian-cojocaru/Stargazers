//
//  StargazerViewModel.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 15/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import Foundation
import UIKit

struct StargazerViewModel {
    
    private let stargazer: Stargazer
    
    var username: Dynamic<String> {
        return Dynamic<String>(self.stargazer.username ?? "")
    }
    
    var avatarURL: Dynamic<String> {
        return Dynamic<String>(self.stargazer.avatarURL ?? "")
    }
    
    var profileWeblink: Dynamic<String> {
        return Dynamic<String>(self.stargazer.profileWeblink ?? "")
    }
    
    init(_ stargazer: Stargazer) {
        self.stargazer = stargazer
    }
}


 
