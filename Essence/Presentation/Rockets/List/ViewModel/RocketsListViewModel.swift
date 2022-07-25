//
//  RocketsListViewModel.swift
//  Essence
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import Foundation

// MARK: Input

protocol RocketsListViewModelInput {
    func viewDidLoad()
    func selectItem(at indexPath: IndexPath)
}

// MARK: Output

enum RocketsListError: Error {
    case unknown(Error)
}

enum RocketsListViewModelState {
    case loading
    case result(Result<RocketsListItemViewModels, RocketsListError>)
}

protocol RocketsListViewModelOutput: AnyObject {
    var title: String { get }
    var onUpdate: ((RocketsListViewModelState) -> Void)? { get set }
}

// MARK: Type Aliases

typealias RocketsListViewModel = RocketsListViewModelInput & RocketsListViewModelOutput

// MARK: -

// MARK: Initialization

final class RocketsListController: RocketsListViewModelOutput {
    var title: String { "Rockets" }
    var onUpdate: ((RocketsListViewModelState) -> Void)?
    var showRocketDetails: ((Rocket) -> Void)?

    private let repository: RocketsRepository
    private var items: Rockets = []

    init(repository: RocketsRepository) {
        self.repository = repository
    }
}

// MARK: RocketsListViewModelInput

extension RocketsListController: RocketsListViewModelInput {
    func viewDidLoad() {
        guard onUpdate != nil else {
            fatalError("Assign `onUpdate` and then call `viewDidLoad`")
        }

        onUpdate?(.loading)
        fetchRocketsFromRepository()
    }

    func selectItem(at indexPath: IndexPath) {
        showRocketDetails?(items[indexPath.row])
    }
}

// MARK: Private Methods

private extension RocketsListController {
    func fetchRocketsFromRepository() {
        repository.fetch { [weak self] result in
            self?.storeItemsInMemory(with: result)
            self?.updateListState(with: result)
        }
    }

    func storeItemsInMemory(with result: Result<Rockets, RequestError>) {
        switch result {
        case .success(let items):
            self.items = items
        case .failure:
            self.items = []
        }
    }

    func updateListState(with result: Result<Rockets, RequestError>) {
        let status = result
            .map { $0.map(RocketsListItemViewModel.init(_:)) }
            .mapError { RocketsListError.unknown($0) }

        onUpdate?(.result(status))
    }
}
