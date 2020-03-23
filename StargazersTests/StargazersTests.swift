//
//  StargazersTests.swift
//  StargazersTests
//
//  Created by Cristian Cojocaru on 23/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import XCTest
@testable import Stargazers
    
class StargazersTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    ///Test StargazerViewModel - NullAndEmptyValue
    func testText_NullAndEmptyValue() {
        let stargazer = Stargazer(username: "", avatarURL: "", profileWeblink: nil)
        let viewModel = StargazerViewModel(stargazer)
        XCTAssertEqual(viewModel.avatarURL.value, nil)
        XCTAssertEqual(viewModel.profileWeblink.value, "")
        XCTAssertEqual(viewModel.username.value, "")
    }
    
    ///Test StargazerListViewModel append function
    func testAppending() {
        let stargazer1 = Stargazer(username: "user_1", avatarURL: "", profileWeblink: "")
        let stargazer2 = Stargazer(username: "user_2", avatarURL: "", profileWeblink: "")
        
        var viewModel = StargazerListViewModel([stargazer1, stargazer2])
        XCTAssertTrue(viewModel.numberOfRows(section: 0) == 2)
        
        let stargazer3 = Stargazer(username: "user_3", avatarURL: "", profileWeblink: "")
        let stargazer4 = Stargazer(username: "user_4", avatarURL: "", profileWeblink: "")
        viewModel.append([stargazer3, stargazer4])
        XCTAssertTrue(viewModel.numberOfRows(section: 0) == 4)
    }
    
    ///Test StargazerListViewModel empty list
    func test_EmptyListOfStargazer() {
        let viewModel = StargazerListViewModel()
        XCTAssertTrue(viewModel.numberOfRows(section: 0) == 0)
    }
}
