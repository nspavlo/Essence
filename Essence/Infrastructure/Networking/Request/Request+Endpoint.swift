//
//  Request+Endpoint.swift
//  Essence
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

// MARK: Endpoint

extension Request {
    init(method: Method, endpoint: Endpoint, params: Encodable?) {
        self.init(method: method, path: endpoint.path(), params: params)
    }
}
