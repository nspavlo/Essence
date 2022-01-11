//
//  AppFlowCoordinator.swift
//  Essence
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

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
    func start(animated: Bool) {
        startIndexFlow(animated: animated)
    }
}

// MARK: Private Methods

private extension AppFlowCoordinator {
    func startIndexFlow(animated: Bool) {
        let indexFlowFactory = appFlowFactory.createIndexFlowFactory()
        let indexFlowCoordinator = indexFlowFactory.createIndexFlowCoordinator(with: router)
        indexFlowCoordinator.start(animated: animated)
    }

    func startRocketsFlow() {
        let rocketsFlowFactory = appFlowFactory.createRocketsFlowFactory()
        let rocketsFlowCoordinator = rocketsFlowFactory.createRocketsFlowCoordinator(with: router)
        rocketsFlowCoordinator.start(animated: !coordinators.isEmpty)
    }
}
