//
//  RocketsRepository.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import Foundation

// MARK: Protocol

protocol RocketsRepository {
    @discardableResult
    func fetch(with completion: @escaping (Result<Rockets, RequestError>) -> Void) -> Cancellable
}
