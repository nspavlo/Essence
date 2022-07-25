//
//  RocketsListItemViewModel.swift
//  Essence
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import Foundation

// MARK: Type Aliases

typealias RocketsListItemViewModels = [RocketsListItemViewModel]

// MARK: Initialization

struct RocketsListItemViewModel: Equatable {
    let title: String
    let subtitle: String
}

// MARK: Adapter

extension RocketsListItemViewModel {
    init(_ rocket: Rocket) {
        self.title = rocket.name
        self.subtitle = rocket.country
    }
}
