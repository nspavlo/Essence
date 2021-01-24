//
//  Reusable.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import Foundation

// MARK: Protocol

protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

// MARK: Default implementation

extension Reusable {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
