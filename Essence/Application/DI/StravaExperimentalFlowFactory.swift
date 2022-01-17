//
//  StravaExperimentalFlowFactory.swift
//  Essence
//
//  Created by Jans Pavlovs on 18/01/2022.
//

import Foundation

// MARK: Initialization

final class StravaExperimentalFlowFactory {}

// MARK: Coordinators

extension StravaExperimentalFlowFactory {
    func createStravaExperimentalFlowCoordinator(with router: Router) -> StravaExperimentalFlowCoordinator {
        StravaExperimentalFlowCoordinator(router: router)
    }
}

