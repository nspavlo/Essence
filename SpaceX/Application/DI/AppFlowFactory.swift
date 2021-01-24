//
//  AppFlowFactory.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import Foundation

// MARK: Initialization

final class AppFlowFactory {
    lazy var dispatcher: RequestDispatcher = {
        AFRequestDispatcher(environment: .development)
    }()
}

// MARK: -

extension AppFlowFactory {
    func createRocketsFlowFactory() -> RocketsFlowFactory {
        RocketsFlowFactory(dispatcher: dispatcher)
    }
}
