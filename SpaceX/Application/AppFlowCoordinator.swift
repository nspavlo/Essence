//
//  AppFlowCoordinator.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Protocol

protocol Coordinator {
    func start()
}

// MARK: Initialization

final class AppFlowCoordinator {
    private let navigationController: UINavigationController
    private let appFlowFactory: AppFlowFactory

    init(navigationController: UINavigationController, appFlowFactory: AppFlowFactory) {
        self.navigationController = navigationController
        self.appFlowFactory = appFlowFactory
    }
}

// MARK: Coordinator

extension AppFlowCoordinator: Coordinator {
    func start() {
        let rocketsFlowFactory = appFlowFactory.createRocketsFlowFactory()
        let coordinator = rocketsFlowFactory.createRocketsFlowCoordinator(with: navigationController)
        coordinator.start()
    }
}
