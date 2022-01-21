//
//  IndexListControllerTest.swift
//  EssenceUnitTests
//
//  Created by Jans Pavlovs on 21/01/2022.
//

import XCTest

@testable import Essence

// MARK: XCTestCase

final class IndexListControllerTest: XCTestCase {
    func test_onAppear_withEmptyRepository_shouldReturnEmptySuccess() {
        var result: Result<IndexListItemViewModels, IndexListError>?
        let sut = IndexListController(repository: LocalIndexRepository(headings: []))
        sut.onUpdate = { result = $0 }

        sut.onAppear()

        XCTAssertEqual(try? result?.get(), [])
    }

    func test_onAppear_withNonEmptyRepository_shouldReturnNonEmptySuccess() {
        var result: Result<IndexListItemViewModels, IndexListError>?
        let sut = IndexListController(repository: LocalIndexRepository(headings: [.strava]))
        sut.onUpdate = { result = $0 }

        sut.onAppear()

        XCTAssertEqual(try? result?.get(), [IndexListItemViewModel(.strava)])
    }

    func test_selection_whenFirstIndexSelected_shouldReturnFirstHeading() {
        var heading: Heading?
        let sut = IndexListController(repository: LocalIndexRepository(headings: [.rockets, .strava]))
        sut.onSelect = { heading = $0 }

        sut.onAppear()
        sut.selectItem(at: IndexPath(row: 1, section: 0))

        XCTAssertEqual(heading, .strava)
    }
}
