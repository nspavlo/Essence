//
//  Rocket.swift
//  Essence
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import Foundation

typealias Rockets = [Rocket]

// MARK: Initialization

struct Rocket {
    typealias Identifier = String

    let id: Identifier
    let name: String
    let description: String
}

// MARK: Decodable

extension Rocket: Decodable {}
