//
//  IndexListItemViewModelTest.swift
//  EssenceUnitTests
//
//  Created by Jans Pavlovs on 11/01/2022.
//

import XCTest

@testable import Essence

// MARK: XCTestCase

final class IndexListItemViewModelTest: XCTestCase {
    func test_equality_withNonMatchingTitle_shouldNotBeEqual() {
        let lhs = IndexListItemViewModel(title: "Index")
        let rhs = IndexListItemViewModel(title: "Rockets")

        XCTAssertNotEqual(lhs, rhs)
    }

    func test_equality_withMatchingTitle_shouldBeEqual() {
        let lhs = IndexListItemViewModel(title: "Index")
        let rhs = IndexListItemViewModel(title: "Index")

        XCTAssertEqual(lhs, rhs)
    }
}
