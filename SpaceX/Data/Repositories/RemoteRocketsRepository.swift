//
//  RemoteRocketsRepository.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 30/01/2021.
//

import Foundation

// MARK: Initialization

final class RemoteRocketsRepository {
    let dispatcher: RequestDispatcher

    init(dispatcher: RequestDispatcher) {
        self.dispatcher = dispatcher
    }
}

// MARK: RocketsRepository

extension RemoteRocketsRepository: RocketsRepository {
    func fetch(with completion: @escaping (Result<Rockets, RequestError>) -> Void) -> Cancellable? {
        let request = Request(method: .get, endpoint: .rockets, params: nil)
        return dispatcher.execute(request, completion: completion)
    }
}
