//
//  IndexFlowFactory.swift
//  Essence
//
//  Created by Jans Pavlovs on 11/11/2021.
//

import Foundation

// MARK: Initialization

final class IndexFlowFactory {}

// MARK: Repositories

extension IndexFlowFactory {
    func createIndexRepository() -> IndexRepository {
        LocalIndexRepository(headings: [
            .rockets
        ])
    }
}

// MARK: Coordinators

extension IndexFlowFactory {
    func createIndexFlowCoordinator(with router: Router) -> IndexFlowCoordinator {
        IndexFlowCoordinator(router: router, indexFlowFactory: self)
    }
}
