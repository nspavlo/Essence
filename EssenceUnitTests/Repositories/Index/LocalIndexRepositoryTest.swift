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

    func test_repository_withStravaHeading_shouldReturnStravaHeading() {
        var result: Result<Headings, RequestError>?
        let sut = LocalIndexRepository(headings: [.strava])

        _ = sut.fetch { result = $0 }

        XCTAssertEqual(try? result?.get(), [.strava])
    }
}
