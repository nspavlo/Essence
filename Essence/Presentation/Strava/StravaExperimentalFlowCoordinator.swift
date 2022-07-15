//
//  StravaExperimentalFlowCoordinator.swift
//  Essence
//
//  Created by Jans Pavlovs on 18/01/2022.
//

import UIKit

// MARK: Initialization

final class StravaExperimentalFlowCoordinator {
    private let router: Router

    init(router: Router) {
        self.router = router
    }
}

// MARK: Coordinator

extension StravaExperimentalFlowCoordinator: Coordinator {
    func start(animated: Bool) {
        showAuthentication(animated: animated)
    }
}

// MARK: Private Methods

private extension StravaExperimentalFlowCoordinator {
    func showAuthentication(animated _: Bool) {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemBackground
        router.push(viewController, animated: true)
    }
}
