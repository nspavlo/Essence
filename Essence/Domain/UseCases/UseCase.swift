//
//  UseCase.swift
//  Essence
//
//  Created by Jans Pavlovs on 12/11/2021.
//

import Foundation

protocol UseCase {
    @discardableResult
    func start() -> Cancellable?
}
