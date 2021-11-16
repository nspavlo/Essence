//
//  IndexListViewModel.swift
//  Essence
//
//  Created by Jans Pavlovs on 11/11/2021.
//

import Foundation

// MARK: Input

protocol IndexListViewModelInput {
    func onAppear()
    func didSelectItem(at indexPath: IndexPath)
}

// MARK: Output

protocol IndexListViewModelOutput: AnyObject {
    var onUpdate: ((IndexListItemViewModels) -> Void)? { get set }
}

// MARK: Protocol

typealias IndexListViewModel = IndexListViewModelInput & IndexListViewModelOutput

// MARK: -

// MARK: Initialization

final class IndexListController: IndexListViewModelOutput {
    var onUpdate: ((IndexListItemViewModels) -> Void)?
    var showHeading: ((Heading) -> Void)?

    private var headings: Headings = []
    private let repository: IndexRepository

    init(repository: IndexRepository) {
        self.repository = repository
    }
}

// MARK: RocketsListViewModelInput

extension IndexListController: IndexListViewModelInput {
    func onAppear() {
        repository.fetch { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let headings):
                self.headings = headings
                self.onUpdate?(headings.map(IndexListItemViewModel.init(_:)))
            case .failure:
                break
            }
        }
    }

    func didSelectItem(at indexPath: IndexPath) {
        showHeading?(headings[indexPath.row])
    }
}
