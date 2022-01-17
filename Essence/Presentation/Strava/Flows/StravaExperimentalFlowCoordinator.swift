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
        fatalError("Here be dragons!")
    }
}
