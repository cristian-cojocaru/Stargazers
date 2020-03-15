//
//  StargazerListViewModel.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 15/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//
        
import Foundation

struct StargazerListViewModel {
    private let stargazerList: [Stargazer]
}

extension StargazerListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRows(section : Int) -> Int {
        return self.stargazerList.count
    }
    
    func stargazerAtIndex(_ index: Int) -> StargazerViewModel {
        let stargazer = self.stargazerList[index]
        return StargazerViewModel(stargazer)
    }
    
    init(_ stargazers: [Stargazer]) {
        self.stargazerList = stargazers
    }
    
}
