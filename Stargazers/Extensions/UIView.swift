//
//  UIView.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 18/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import UIKit

extension UIView {
    func setupShadow(opacity: Float = 0, radius: CGFloat = 0, offset: CGSize = .zero, color: UIColor = .black) {
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
    }
}
