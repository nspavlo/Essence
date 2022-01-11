//
//  RocketsListViewModel.swift
//  Essence
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import Foundation

// MARK: Input

protocol RocketsListViewModelInput {
    func onAppear()
    func selectItem(at indexPath: IndexPath)
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

final class RocketsListController: RocketsListViewModelOutput {
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

extension RocketsListController: RocketsListViewModelInput {
    func onAppear() {
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

    func selectItem(at indexPath: IndexPath) {
        showRocketDetails?(rockets[indexPath.row])
    }
}
