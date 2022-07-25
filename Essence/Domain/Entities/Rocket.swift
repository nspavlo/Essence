//
//  Rocket.swift
//  Essence
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import Foundation

// MARK: Type Aliases

typealias Rockets = [Rocket]

// MARK: Initialization

struct Rocket {
    typealias Identifier = String

    let id: Identifier
    let name: String
    let description: String
    let country: String
}

// MARK: Decodable

extension Rocket: Decodable {}

// MARK: Equatable

extension Rocket: Equatable {
    public static func == (lhs: Rocket, rhs: Rocket) -> Bool {
        lhs.id == rhs.id
    }
}
