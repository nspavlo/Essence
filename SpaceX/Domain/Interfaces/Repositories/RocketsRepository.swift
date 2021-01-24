//
//  RocketsRepository.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import Foundation

// https://github.com/Moya/Moya
// https://github.com/Alamofire/Alamofire

protocol RocketsRepository {
    @discardableResult
    func fetchRockets(with completion: Result<Rockets, Error>) -> Cancellable
}
