//
//  RocketsFlowCoordinator.swift
//  Essence
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Initialization

final class RocketsFlowCoordinator {
    private let router: Router
    private let rocketsFlowFactory: RocketsFlowFactory

    init(router: Router, rocketsFlowFactory: RocketsFlowFactory) {
        self.router = router
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
        router.push(viewController, animated: animated)
    }

    func showRocketDetails(with _: Rocket, animated: Bool) {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        router.push(viewController, animated: animated)
    }
}
