//
//  Endpoint.swift
//  Essence
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

// MARK: Initialization

enum Endpoint {
    case rockets
}

// MARK: -

extension Endpoint {
    func path() -> String {
        switch self {
        case .rockets:
            return "/rockets"
        }
    }
}
