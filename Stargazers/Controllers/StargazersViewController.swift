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
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var searchView: UIView!
    
    private var stargazersListVM = StargazerListViewModel()
    private let loader = ImageLoader()
    private var currentPage = 1
    private var isFetching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stargazersTableView.dataSource = self
        stargazersTableView.delegate = self
        stargazersTableView.tableFooterView = UIView()
        stargazersTableView.register(UINib(nibName: "StargazerTableViewCell", bundle: nil), forCellReuseIdentifier: "StargazerTableViewCell")

        searchView.setupShadow(opacity: 0.4, radius: 8, offset: .init(width: 0, height: 5), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    }

    @IBAction func searchStargazers(_ sender: UIButton) {
        
        view.endEditing(true)
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        guard let username = usernameTextField.text,
            let repositoryName = repositoryTextField.text,
            !username.isEmpty,
            !repositoryName.isEmpty else {
                activityIndicatorView.stopAnimating()
                Alert.showInfo(title: "Error", message: "Please fill all fields")
                return
        }
        
        getStargazers(username: username, repositoryName: repositoryName, page: currentPage)
        
    }
    
    private func getStargazers(username:String, repositoryName: String, page: Int) {
        isFetching = true
        let request = StargazerRequest(userName: username, repositoryName: repositoryName, page: page)
        request.perform { (result) in
            self.stargazersListVM.append(result.stargazers)
            DispatchQueue.main.async {
                self.stargazersTableView.isHidden = false
                
                self.stargazersTableView.beginUpdates()
                self.stargazersTableView.insertRows(at: ((self.currentPage - 1) * 30...self.currentPage * 30 - 1).map { return IndexPath(row: $0, section: 0)}, with: .automatic)
                self.stargazersTableView.endUpdates()
                
                self.isFetching = false
                self.activityIndicatorView.isHidden = true
                self.activityIndicatorView.stopAnimating()
                
            }
        }
    }
}

extension StargazersViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stargazersListVM.numberOfRows(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StargazerTableViewCell", for: indexPath) as! StargazerTableViewCell
        
        if let stargazer = self.stargazersListVM.stargazerAtIndex(indexPath.row) {
            cell.configure(with: stargazer)
        }
        
        if !isFetching, indexPath.row == self.stargazersListVM.numberOfRows(section: 1) - 10,
            let username = usernameTextField.text,
            let repositoryName = repositoryTextField.text {
            currentPage += 1
            getStargazers(username: username, repositoryName: repositoryName, page: currentPage)
        }
        
        return cell
    }
}

extension StargazersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let username = usernameTextField.text,
            let repositoryName = repositoryTextField.text,
            !username.isEmpty,
            !repositoryName.isEmpty else {
            return nil
        }
        return "\"\(repositoryName)\" by \(username)"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
    }
}
