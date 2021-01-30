//
//  RequestDispatcher.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

// MARK: Error

enum RequestError: Error {
    case error(code: Int, data: Data?)
    case underlying(Error)
    case cancelled
}

// MARK: Protocol

protocol RequestDispatcher: AnyObject {
    @discardableResult
    func execute<T: Decodable>(
        _ request: Request,
        completion: @escaping (Result<T, RequestError>) -> Void
    ) -> Cancellable?
}
