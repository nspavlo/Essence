//
//  Heading.swift
//  Essence
//
//  Created by Jans Pavlovs on 11/11/2021.
//

import Foundation

// MARK: Type Aliases

typealias Headings = [Heading]

// MARK: Initialization

enum Heading: String {
    case rockets = "SpaceX"
    case strava = "STRAVA"
}

// MARK: Public

extension Heading {
    var title: String { rawValue }
}
