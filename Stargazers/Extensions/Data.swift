//
//  Data.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 15/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import Foundation

extension Data {
    func toObject<T:Decodable>(of type: T.Type) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: self)
        } catch let error as NSError {
            print(error.userInfo)
            return nil
        }
    }
}
