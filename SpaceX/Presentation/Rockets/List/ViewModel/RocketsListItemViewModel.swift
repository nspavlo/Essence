//
//  RocketsListItemViewModel.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import Foundation

typealias RocketsListItemViewModels = [RocketsListItemViewModel]

// MARK: Initialization

struct RocketsListItemViewModel {
    let title: String
}

// MARK: Equatable

extension RocketsListItemViewModel: Hashable {}

// MARK: Mapping

extension RocketsListItemViewModel {
    init(_ rocket: Rocket) {
        self.title = rocket.name
    }
}
