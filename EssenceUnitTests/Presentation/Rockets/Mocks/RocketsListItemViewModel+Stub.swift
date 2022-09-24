//
//  RocketsListItemViewModel+Stub.swift
//  EssenceUnitTests
//
//  Created by Jans Pavlovs on 24/09/2022.
//

@testable import Essence

// MARK: -

extension RocketsListItemViewModel {
    static func stub(
        title: String = "Index",
        subtitle: String = "Latvia"
    ) -> RocketsListItemViewModel {
        RocketsListItemViewModel(title: title, subtitle: subtitle)
    }
}
