//
//  Environment.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

// MARK: Initialization

enum Environment: String {
    var path: String {
        return "https://\(self.rawValue)/v4"
    }

    case development = "api.spacexdata.com"
}
