//
//  StargazerTableViewCell.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 16/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import UIKit

class StargazerTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileWeblinkLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with stargazer: StargazerViewModel) {
        usernameLabel.text = stargazer.username
        profileWeblinkLabel.text = stargazer.profileWeblink
        guard let url = URL(string: stargazer.avatarURL) else {
                return
        }
        
        //TODO:- downloading images only to work, will be improved in next commit
        do {
            let data = try Data(contentsOf: url)
            avatarImageView.image = UIImage(data: data)
        } catch {
            print("cell image error")
        }
    }
    
}
