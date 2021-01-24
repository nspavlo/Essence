//
//  RocketsFlowFactory.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Initialization

final class RocketsFlowFactory {}

// MARK: -

extension RocketsFlowFactory {
    func createRocketsFlowCoordinator(with navigationController: UINavigationController) -> Coordinator {
        RocketsFlowCoordinator(navigationController: navigationController)
    }
}
