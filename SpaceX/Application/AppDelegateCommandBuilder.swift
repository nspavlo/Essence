//
//  AppDelegateCommandBuilder.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Protocol

protocol Command {
    func execute()
}

// MARK: -

// MARK: Initialization

final class AppDelegateCommandBuilder {
    private var options: [UIApplication.LaunchOptionsKey: Any]?
}

// MARK: Public Methods

extension AppDelegateCommandBuilder {
    func setupLaunchingOptions(
        _ options: [UIApplication.LaunchOptionsKey: Any]?
    ) -> AppDelegateCommandBuilder {
        self.options = options
        return self
    }

    func make() -> [Command] {
        []
    }
}

// MARK: Convenience

extension Array where Element == Command {
    func execute() {
        forEach { $0.execute() }
    }
}
