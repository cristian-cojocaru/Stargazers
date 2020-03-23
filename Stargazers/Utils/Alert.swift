//
//  Alert.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 23/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import UIKit
class Alert {
    
    class func showInfo(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: .none))
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
}
