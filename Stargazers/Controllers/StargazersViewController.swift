//
//  StargazersViewController.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 14/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import UIKit

class StargazersViewController: UIViewController {
            
    @IBOutlet weak var stargazersTableView: UITableView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var repositoryTextField: UITextField!
    
    private var stargazersListVM: StargazerListViewModel!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stargazersTableView.dataSource = self
        stargazersTableView.delegate = self
        stargazersTableView.register(UINib(nibName: "StargazerTableViewCell", bundle: nil), forCellReuseIdentifier: "StargazerTableViewCell")
        
        usernameTextField.text = "cristian-cojocaru"
        repositoryTextField.text = "QuizApp-Android"
    }
    
    //TODO:- will be moved in service file
    private func getStargazers(username:String, repositoryName: String) {
        let request = StargazerRequest(userName: username, repositoryName: repositoryName)
        NetworkManager().performRequest(request: request) { (result) in
            switch result {
            case .failure(.domainError), .failure(.decodingError), .failure(.invalidResponse), .failure(.networkError) :
                fatalError("not working")
            case .success(let result) :
                guard let result = (result as? StargazerResponse) else {
                    print("couldnt cast")
                    return
                }
         
                self.stargazersListVM = StargazerListViewModel(result.stargazers)
                DispatchQueue.main.async {
                    self.stargazersTableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func searchStargazers(_ sender: UIButton) {
        guard let username = usernameTextField.text,
            let repositoryName = repositoryTextField.text,
        !username.isEmpty,
            !repositoryName.isEmpty else {
                
                print("PLS complete all fields")
                return
        }
        
        getStargazers(username: username, repositoryName: repositoryName)
        
    }
}

extension StargazersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stargazersListVM == nil ? 0 : self.stargazersListVM.numberOfRows(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StargazerTableViewCell", for: indexPath) as! StargazerTableViewCell
        let stargazer = self.stargazersListVM.stargazerAtIndex(indexPath.row)
        cell.configure(with: stargazer)
        return cell
    }
}

extension StargazersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}
