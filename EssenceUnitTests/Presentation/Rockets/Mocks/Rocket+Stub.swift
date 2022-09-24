//
//  Rocket+Stub.swift
//  EssenceUnitTests
//
//  Created by Jans Pavlovs on 27/01/2021.
//

@testable import Essence

// MARK: -

extension Rocket {
    static func stub(
        id: Rocket.Identifier,
        name: String = "Fake Unit Test Object",
        description: String = "Created For Unit Testing",
        country: String = "Fake Country"
    ) -> Rocket {
        Rocket(
            id: id,
            name: name,
            description: description,
            country: country
        )
    }
}
