//
//  RocketsListViewModel.swift
//  SpaceX
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

// MARK: Initialization

final class RocketsListController: RocketsListViewModel {
    var changeState: ((RocketsListViewModelState) -> Void)?
    var showRocketDetails: ((Rocket) -> Void)?

    private var items: [RocketsListItemViewModel] = []
    private var rockets: Rockets = []
}

// MARK: RocketsListViewModelInput

extension RocketsListController {
    func viewDidLoad() {
        changeState?(.loading)

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [self] in
            rockets = [
                Rocket(name: "F1"),
                Rocket(name: "F2"),
                Rocket(name: "F3")
            ]

            items = rockets.map(RocketsListItemViewModel.init(_:))
            changeState?(.result(.success(items)))
        }
    }

    func didSelectItem(at indexPath: IndexPath) {
        showRocketDetails?(rockets[indexPath.row])
    }
}
