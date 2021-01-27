//
//  Environment.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

// MARK: Initialization

enum Environment: String {
    var version: String {
        "v4"
    }

    var path: String {
        "https://\(rawValue)/\(version)"
    }

    case development = "api.spacexdata.com"
}
