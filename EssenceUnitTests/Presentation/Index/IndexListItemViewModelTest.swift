//
//  IndexListItemViewModelTest.swift
//  EssenceUnitTests
//
//  Created by Jans Pavlovs on 11/01/2022.
//

import XCTest

@testable import Essence

// MARK: Test

final class IndexListItemViewModelTest: XCTestCase {
    func testTwoNonEqualViewModels() throws {
        let a = IndexListItemViewModel(title: "Index")
        let b = IndexListItemViewModel(title: "Rockets")
        XCTAssertNotEqual(a, b)
    }

    func testTwoEqualViewModels() throws {
        let a = IndexListItemViewModel(title: "Index")
        let b = IndexListItemViewModel(title: "Index")
        XCTAssertEqual(a, b)
    }
}
