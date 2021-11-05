//
//  Router.swift
//  Essence
//
//  Created by Jans Pavlovs on 27/01/2021.
//

import UIKit

// MARK: Protocol

protocol Router: AnyObject {
    func push(_ viewController: UIViewController, animated: Bool)
}
