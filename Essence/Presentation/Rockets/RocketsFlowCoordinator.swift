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
    func start(animated: Bool) {
        start(with: .rocket(nil), animated: animated)
    }

    func start(with link: Link, animated: Bool) {
        switch link {
        case .index:
            fatalError("Unable to start \(self) with \(link)")
        case .rocket(let rocket):
            if let rocket {
                showRocketDetails(with: rocket, animated: animated)
            } else {
                showRocketsList(animated: animated)
            }

        }
    }
}

// MARK: Private Methods

private extension RocketsFlowCoordinator {
    func showRocketsList(animated: Bool) {
        let repository = rocketsFlowFactory.createRocketsRepository()
        let viewModel = RocketsListController(repository: repository)
        viewModel.showRocketDetails = { rocket in
            self.start(with: .rocket(rocket), animated: true)
        }
        let viewController = RocketsContainerViewController(viewModel: viewModel)
        router.push(viewController, animated: animated)
    }

    func showRocketDetails(with _: Rocket, animated: Bool) {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemBackground
        router.push(viewController, animated: animated)
    }
}
