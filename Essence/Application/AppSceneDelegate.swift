//
//  SceneDelegate.swift
//  Essence
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Initialization

class SceneDelegate: UIResponder {
    var window: UIWindow?
    var coordinator: AppFlowCoordinator?
}

// MARK: Private Methods

extension SceneDelegate {
    func setupMainWindow(with navigationController: UINavigationController) {
        window?.rootViewController = navigationController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }

    func setupAppFlowCoordinator(with navigationController: UINavigationController) {
        coordinator = AppFlowCoordinator(
            router: NavigationRouter(
                navigationController: navigationController
            ),
            appFlowFactory: AppFlowFactory()
        )
        coordinator?.start(animated: false)
    }
}

// MARK: UIWindowSceneDelegate

extension SceneDelegate: UIWindowSceneDelegate {
    func scene(
        _ scene: UIScene,
        willConnectTo _: UISceneSession,
        options _: UIScene.ConnectionOptions
    ) {
        window = (scene as? UIWindowScene)
            .map(UIWindow.init(windowScene:))

        let navigationController = UINavigationController()
        setupAppFlowCoordinator(with: navigationController)
        setupMainWindow(with: navigationController)
    }
}
