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
        let a = IndexListItemViewModel(title: "Index")
        let b = IndexListItemViewModel(title: "Rockets")

        XCTAssertNotEqual(a, b)
    }

    func test_equality_withMatchingTitle_shouldBeEqual() {
        let a = IndexListItemViewModel(title: "Index")
        let b = IndexListItemViewModel(title: "Index")

        XCTAssertEqual(a, b)
    }
}
