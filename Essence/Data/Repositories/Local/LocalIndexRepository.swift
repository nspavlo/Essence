//
//  LocalIndexRepository.swift
//  Essence
//
//  Created by Jans Pavlovs on 11/11/2021.
//

import Foundation

// MARK: Initialization

struct LocalIndexRepository {
    let headings: Headings
}

// MARK: RocketsRepository

extension LocalIndexRepository: IndexRepository {
    func fetch(with completion: @escaping (Result<Headings, RequestError>) -> Void) -> Cancellable? {
        completion(.success(headings))
        return nil
    }
}
