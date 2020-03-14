//
//  Dictionary.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 14/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import Foundation

extension Dictionary {
    
    /**
        *Print pretty json of dictionaries in lldb.*
     */

    func pretty() {
        if #available(iOS 11.0, *) {
            print(String(data: try! JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted, .sortedKeys]), encoding: .utf8 )!)
        } else {
            print("Keys are not sorted...") //.sorted not available lower than 11.0
            print(String(data: try! JSONSerialization.data(withJSONObject: self, options: .prettyPrinted), encoding: .utf8 )!)
        }
    }
    
    /**
        *Transform a dictionary to Data object*
     */
    func toData() -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        } catch let error as NSError {
            print(error.userInfo)
            return nil
        }
    }
    
    /**
            *Transform a dictionary to a custom object of type T*
     */
    func toObject<T:Decodable>(of type: T.Type) -> T?{
          do {
            guard let data = self.toData() else { return nil }
            return try JSONDecoder().decode(T.self, from: data)
          } catch let error as NSError {
              print(error.userInfo)
              return nil
          }
      }
}

