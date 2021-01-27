//
//  Rocket+Stub.swift
//  SpaceXTests
//
//  Created by Jans Pavlovs on 27/01/2021.
//

@testable import SpaceX

// MARK -

extension Rocket {
    static func stub(
        id: Rocket.Identifier = "1",
        name: String = "Fake Unit Test Object",
        description: String = "Created For Unit Testing"
    ) -> Rocket {
        Rocket(id: id, name: name, description: description)
    }
}
