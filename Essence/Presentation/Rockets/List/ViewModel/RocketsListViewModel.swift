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

enum RocketsListError: Error {
    case unknown(Error)
}

enum RocketsListViewModelState {
    case loading
    case result(Result<RocketsListItemViewModels, RocketsListError>)
}

protocol RocketsListViewModelOutput: AnyObject {
    var onUpdate: ((RocketsListViewModelState) -> Void)? { get set }
}

// MARK: Protocol

typealias RocketsListViewModel = RocketsListViewModelInput & RocketsListViewModelOutput

// MARK: -

// MARK: Initialization

final class RocketsListController: RocketsListViewModelOutput {
    var onUpdate: ((RocketsListViewModelState) -> Void)?
    var onSelect: ((Rocket) -> Void)?

    private var rockets: Rockets = []
    private let repository: RocketsRepository

    init(repository: RocketsRepository) {
        self.repository = repository
    }
}

// MARK: RocketsListViewModelInput

extension RocketsListController: RocketsListViewModelInput {
    func onAppear() {
        onUpdate?(.loading)

        repository.fetch { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let rockets):
                self.rockets = rockets
                self.onUpdate?(.result(.success(rockets.map(RocketsListItemViewModel.init(_:)))))
            case .failure(let error):
                self.onUpdate?(.result(.failure(.unknown(error))))
            }
        }
    }

    func selectItem(at indexPath: IndexPath) {
        onSelect?(rockets[indexPath.row])
    }
}
