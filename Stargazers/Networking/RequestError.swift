//
//  RequestErrors.swift
//  Stargazers
//
//  Created by Cristian Cojocaru on 14/03/2020.
//  Copyright © 2020 Cristian Cojocaru. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case domainError
    case networkError
    case decodingError
    case invalidResponse
}
