//
//  DynamicType.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 18/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import Foundation

// type erasure
class Dynamic<T>: Decodable where T: Decodable {
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    var value: T {
        didSet {
            self.listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bindToView(listener: @escaping Listener) {
        self.listener = listener
        self.listener?(self.value)
    }
    
    private enum CodingKeys: CodingKey {
        case value
    }
    
}
