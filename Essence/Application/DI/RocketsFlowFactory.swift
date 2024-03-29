//
//  RocketsFlowFactory.swift
//  Essence
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Initialization

final class RocketsFlowFactory {
    private let dispatcher: RequestDispatcher

    init(dispatcher: RequestDispatcher) {
        self.dispatcher = dispatcher
    }
}

// MARK: Repositories

extension RocketsFlowFactory {
    func createRocketsRepository() -> RocketsRepository {
        RemoteRocketsRepository(dispatcher: dispatcher)
    }
}

// MARK: Coordinators

extension RocketsFlowFactory {
    func createRocketsFlowCoordinator(with router: Router) -> Coordinator {
        RocketsFlowCoordinator(router: router, rocketsFlowFactory: self)
    }
}
