//
//  AFRequestDispatcher.swift
//  Essence
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Alamofire

// MARK: Initialization

final class AFRequestDispatcher {
    let environment: Environment

    init(environment: Environment) {
        self.environment = environment
    }
}

// MARK: RequestDispatcher

extension AFRequestDispatcher: RequestDispatcher {
    func execute<T>(
        _ request: Request,
        completion: @escaping (Result<T, RequestError>) -> Void
    ) -> Cancellable? where T: Decodable {
        AF
        .request(
            environment.path + request.path,
            method: HTTPMethod(rawValue: request.method.rawValue)
        )
        .responseDecodable(of: T.self) { response in
            let result = response.result.mapError { RequestError.underlying($0 as Error) }
            completion(result)
        }

        return nil
    }
}
