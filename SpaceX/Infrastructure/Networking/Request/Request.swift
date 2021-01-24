//
//  Request.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

// MARK: Initialization

struct Request {
    enum Method: String, Codable {
        case get
        case post
        case patch
        case delete
        case head
    }

    let method: Method
    let path: String
    let params: Encodable?
}
