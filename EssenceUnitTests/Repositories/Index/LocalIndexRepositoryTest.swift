//
//  LocalIndexRepositoryTest.swift
//  EssenceUnitTests
//
//  Created by Jans Pavlovs on 21/01/2022.
//

import XCTest

@testable import Essence

// MARK: Test

final class LocalIndexRepositoryTest: XCTestCase {
    func testEmptyRepository() {
        var result: Result<Headings, RequestError>?
        let sut = LocalIndexRepository(headings: [])
        _ = sut.fetch { result = $0 }
        XCTAssertEqual(try? result?.get(), [])
    }

    func testNonEmptyRepository() {
        var result: Result<Headings, RequestError>?
        let sut = LocalIndexRepository(headings: [.strava])
        _ = sut.fetch { result = $0 }
        XCTAssertEqual(try? result?.get(), [.strava])
    }
}
