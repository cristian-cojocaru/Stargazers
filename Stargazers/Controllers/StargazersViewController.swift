//
//  StargazersViewController.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 14/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import UIKit

class StargazersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let request = StargazerRequest(userName: "cristian-cojocaru", repositoryName: "QuizApp-Android")
        NetworkManager().performRequest(request: request) { (result) in
            switch result {
            case .failure(.domainError), .failure(.decodingError), .failure(.invalidResponse), .failure(.networkError) :
                fatalError("not working")
            case .success(let stargazers) :
                print(stargazers)
         
            }
        }
    }


}

