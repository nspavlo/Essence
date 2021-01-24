//
//  Rocket.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import Foundation

typealias Rockets = [Rocket]

// MARK: Initialization

struct Rocket {
    let id: String
    let name: String
    let description: String
}

// MARK: Decodable

extension Rocket: Decodable {}
