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
    func didSelectItem(at indexPath: IndexPath)
}

// MARK: Output

enum RocketsListViewModelState {
    case loading
    case result(Result<[RocketsListItemViewModel], Error>)
}

protocol RocketsListViewModelOutput: AnyObject {
    var changeState: ((RocketsListViewModelState) -> Void)? { get set }
}

// MARK: Protocol

typealias RocketsListViewModel = RocketsListViewModelInput & RocketsListViewModelOutput

// MARK: -

// MARK: Initialization

final class RocketsListController: RocketsListViewModel {
    var changeState: ((RocketsListViewModelState) -> Void)?
    var showRocketDetails: ((Rocket) -> Void)?

    private var items: [RocketsListItemViewModel] = []
    private var rockets: Rockets = []
    private let repository: RocketsRepository

    init(repository: RocketsRepository) {
        self.repository = repository
    }
}

// MARK: RocketsListViewModelInput

extension RocketsListController {
    func viewDidLoad() {
        changeState?(.loading)

        repository.fetch { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let rockets):
                self.rockets = rockets
                self.items = rockets.map(RocketsListItemViewModel.init(_:))
                self.changeState?(.result(.success(self.items)))
            case .failure(let error):
                self.changeState?(.result(.failure(error)))
            }
        }
    }

    func didSelectItem(at indexPath: IndexPath) {
        showRocketDetails?(rockets[indexPath.row])
    }
}
