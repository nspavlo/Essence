//
//  RocketsFlowCoordinator.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Initialization

final class RocketsFlowCoordinator {
    private let navigationController: UINavigationController
    private let rocketsFlowFactory: RocketsFlowFactory

    init(
        navigationController: UINavigationController,
        rocketsFlowFactory: RocketsFlowFactory
    ) {
        self.navigationController = navigationController
        self.rocketsFlowFactory = rocketsFlowFactory
    }
}

// MARK: Coordinator

extension RocketsFlowCoordinator: Coordinator {
    func start() {
        showRocketsList(animated: false)
    }

    func showRocketsList(animated: Bool) {
        let repository = rocketsFlowFactory.createRocketsRepository()
        let viewModel = RocketsListController(repository: repository)
        viewModel.showRocketDetails = { rocket in
            self.showRocketDetails(with: rocket, animated: true)
        }
        let viewController = RocketsContainerViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: animated)
    }

    func showRocketDetails(with _: Rocket, animated: Bool) {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        navigationController.pushViewController(viewController, animated: animated)
    }
}
