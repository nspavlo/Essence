//
//  AppFlowCoordinator.swift
//  Essence
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import Foundation

// MARK: Initialization

final class AppFlowCoordinator {
    private let router: Router
    private let appFlowFactory: AppFlowFactory
    private var coordinators = [Coordinator]()

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

    func start(with link: Link, animated: Bool) {
        switch link {
        case .index:
            startIndexFlow(animated: animated)
        case .rocket:
            startRocketsFlow(with: link, animated: animated)
        }
    }
}

// MARK: Private Methods

private extension AppFlowCoordinator {
    func startIndexFlow(animated: Bool) {
        let indexFlowFactory = appFlowFactory.createIndexFlowFactory()
        let indexFlowCoordinator = indexFlowFactory.createIndexFlowCoordinator(with: router)
        indexFlowCoordinator.showHeading = { [unowned self] heading in
            self.startAppropriateFlow(for: heading)
        }
        indexFlowCoordinator.start(animated: animated)
        coordinators = [indexFlowCoordinator]
    }

    func startRocketsFlow(with link: Link, animated: Bool) {
        let rocketsFlowFactory = appFlowFactory.createRocketsFlowFactory()
        let rocketsFlowCoordinator = rocketsFlowFactory.createRocketsFlowCoordinator(with: router)
        rocketsFlowCoordinator.start(with: link, animated: animated)
    }
}

// MARK: Adapters

private extension AppFlowCoordinator {
    func startAppropriateFlow(for heading: Heading) {
        switch heading {
        case .rocketsLegacy,
             .rockets:
            startRocketsFlow(with: .rocket(nil), animated: !coordinators.isEmpty)
        }
    }
}
