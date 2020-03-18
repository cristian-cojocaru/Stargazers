//
//  UIImageView.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 18/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func loadImage(at url: URL) {
        UIImageLoader.loader.load(url, for: self)
    }
    
    func cancelImageLoad() {
        UIImageLoader.loader.cancel(for: self)
    }
}
