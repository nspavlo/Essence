//
//  IndexRepository.swift
//  Essence
//
//  Created by Jans Pavlovs on 11/11/2021.
//

import Foundation

// MARK: Protocol

protocol IndexRepository {
    @discardableResult
    func fetch(with completion: @escaping (Result<Headings, RequestError>) -> Void) -> Cancellable?
}
