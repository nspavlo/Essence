//
//  Cancellable.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import Foundation

// MARK: Protocol

protocol Cancellable {
    func cancel()
}

// MARK: Dummy Implementation

struct DummyCancellable: Cancellable {
    func cancel() {}
}
