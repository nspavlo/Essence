//
//  Coordinator.swift
//  Essence
//
//  Created by Jans Pavlovs on 27/01/2021.
//

import Foundation

// MARK: Linking

enum Link {
    case index
    case rocket(Rocket?)
}

// MARK: Protocol

protocol Coordinator {
    func start(animated: Bool)
    func start(with link: Link, animated: Bool)
}

// MARK: Extensions

extension Coordinator {
    func start() {
        start(animated: true)
    }
}
