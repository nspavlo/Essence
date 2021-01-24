//
//  RequestDispatcher.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

// MARK: Protocol

protocol RequestDispatcher: class {
    func execute<T: Decodable>(_ request: Request, completion: @escaping (Result<T, Error>) -> Void)
}
