//
//  IndexListItemViewModel.swift
//  Essence
//
//  Created by Jans Pavlovs on 11/11/2021.
//

import Foundation

// MARK: Type Aliases

typealias IndexListItemViewModels = [IndexListItemViewModel]

// MARK: Initialization

class IndexListItemViewModel {
    let title: String

    init(title: String) {
        self.title = title
    }
}

// MARK: Adapter

extension IndexListItemViewModel {
    convenience init(_ heading: Heading) {
        self.init(title: heading.title)
    }
}

// MARK: Identifiable

extension IndexListItemViewModel: Identifiable {}

// MARK: Equatable

extension IndexListItemViewModel: Equatable {
    static func == (lhs: IndexListItemViewModel, rhs: IndexListItemViewModel) -> Bool {
        lhs.title == rhs.title
    }
}
