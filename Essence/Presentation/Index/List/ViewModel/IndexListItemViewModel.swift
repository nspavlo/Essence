//
//  IndexListItemViewModel.swift
//  Essence
//
//  Created by Jans Pavlovs on 11/11/2021.
//

import Foundation

typealias IndexListItemViewModels = [IndexListItemViewModel]

// MARK: Initialization

class IndexListItemViewModel {
    let title: String

    init(_ heading: Heading) {
        switch heading {
        case .rockets:
            self.title = "SpaceX Rockets"
        }
    }
}

// MARK: Identifiable

extension IndexListItemViewModel: Identifiable {}
