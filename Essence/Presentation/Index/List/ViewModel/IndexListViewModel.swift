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
    func selectItem(at indexPath: IndexPath)
}

// MARK: Output

enum IndexListError: Error {
    case unknown(Error)
}

protocol IndexListViewModelOutput: AnyObject {
    var onUpdate: ((Result<IndexListItemViewModels, IndexListError>) -> Void)? { get set }
}

// MARK: Protocol

typealias IndexListViewModel = IndexListViewModelInput & IndexListViewModelOutput

// MARK: -

// MARK: Initialization

final class IndexListController: IndexListViewModelOutput {
    var onUpdate: ((Result<IndexListItemViewModels, IndexListError>) -> Void)?
    var onSelect: ((Heading) -> Void)?

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
                self.onUpdate?(.success(headings.map(IndexListItemViewModel.init(_:))))
            case .failure:
                fatalError("Unimplemented")
            }
        }
    }

    func selectItem(at indexPath: IndexPath) {
        onSelect?(headings[indexPath.row])
    }
}
