//
//  NavigationRouter.swift
//  Essence
//
//  Created by Jans Pavlovs on 30/01/2021.
//

import UIKit

// MARK: Initialization

final class NavigationRouter {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: Router

extension NavigationRouter: Router {
    func push(_ viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
}
