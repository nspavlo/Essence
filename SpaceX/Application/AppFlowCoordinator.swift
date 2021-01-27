//
//  AppFlowCoordinator.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Initialization

final class NavigationRouter {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: Router

extension NavigationRouter: Router {
    func push(_ viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
}

// MARK: -

// MARK: Initialization

final class AppFlowCoordinator {
    private let router: Router
    private let appFlowFactory: AppFlowFactory

    init(router: Router, appFlowFactory: AppFlowFactory) {
        self.router = router
        self.appFlowFactory = appFlowFactory
    }
}

// MARK: Coordinator

extension AppFlowCoordinator: Coordinator {
    func start() {
        let rocketsFlowFactory = appFlowFactory.createRocketsFlowFactory()
        let coordinator = rocketsFlowFactory.createRocketsFlowCoordinator(with: router)
        coordinator.start()
    }
}
