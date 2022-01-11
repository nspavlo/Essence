//
//  Coordinator.swift
//  Essence
//
//  Created by Jans Pavlovs on 27/01/2021.
//

import Foundation

// MARK: Protocol

protocol Coordinator {
    func start(animated: Bool)
}

// MARK: Extensions

extension Coordinator {
    func start() {
        start(animated: true)
    }
}
