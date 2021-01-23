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
    private let appFlowContainer: AppFlowContainer

    init(navigationController: UINavigationController, appFlowContainer: AppFlowContainer) {
        self.navigationController = navigationController
        self.appFlowContainer = appFlowContainer
    }
}

// MARK: Coordinator

extension AppFlowCoordinator: Coordinator {
    func start() {}
}
