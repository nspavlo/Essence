//
//  AnyEncodable.swift
//  Essence
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

// MARK: Initialization

struct AnyEncodable: Encodable {
    let value: Encodable?

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try value?.encode(to: &container)
    }
}

// MARK: -

extension Encodable {
    func encode(to container: inout SingleValueEncodingContainer) throws {
        try container.encode(self)
    }
}
