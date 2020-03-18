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
    
    func configure(with stargazer: StargazerViewModel) {
        stargazer.username.bindToView { self.usernameLabel.text = $0 }
        stargazer.profileWeblink.bindToView { self.profileWeblinkLabel.text = $0 }
        avatarImageView.loadImage(at: URL(string: stargazer.avatarURL.value)!)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = UIImage(named: "placeholder_image")
        avatarImageView.cancelImageLoad()
    }
}
