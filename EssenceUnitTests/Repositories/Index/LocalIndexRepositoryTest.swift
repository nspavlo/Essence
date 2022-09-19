//
//  LocalIndexRepositoryTest.swift
//  EssenceUnitTests
//
//  Created by Jans Pavlovs on 21/01/2022.
//

import XCTest

@testable import Essence

// MARK: XCTestCase

final class LocalIndexRepositoryTest: XCTestCase {
    func test_repository_withEmptyHeadingsArray_shouldReturnEmptyHeadingsArray() {
        var result: Result<Headings, RequestError>?
        let sut = LocalIndexRepository(headings: [])

        _ = sut.fetch { result = $0 }

        XCTAssertEqual(try? result?.get(), [])
    }

    func test_repository_withRocketsHeading_shouldReturnRocketsHeading() {
        var result: Result<Headings, RequestError>?
        let sut = LocalIndexRepository(headings: [.rockets])

        _ = sut.fetch { result = $0 }

        XCTAssertEqual(try? result?.get(), [.rockets])
    }
}
