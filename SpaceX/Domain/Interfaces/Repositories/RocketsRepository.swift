//
//  RocketsRepository.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import Foundation

protocol RocketsRepository {
    @discardableResult
    func fetch(with completion: @escaping (Result<Rockets, Error>) -> Void) -> Cancellable
}
