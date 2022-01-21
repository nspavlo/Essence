//
//  IndexListControllerTest.swift
//  EssenceUnitTests
//
//  Created by Jans Pavlovs on 21/01/2022.
//

import XCTest

@testable import Essence

// MARK: Test

final class IndexListControllerTest: XCTestCase {
    func testOnAppearEmptySuccessReponse() throws {
        var result: Result<IndexListItemViewModels, IndexListError>?
        let sut = IndexListController(repository: LocalIndexRepository(headings: []))
        sut.onUpdate = { result = $0 }
        sut.onAppear()
        XCTAssertEqual(try? result?.get(), [])
    }

    func testOnAppearNonEmptySuccessResponse() throws {
        var result: Result<IndexListItemViewModels, IndexListError>?
        let sut = IndexListController(repository: LocalIndexRepository(headings: [.strava]))
        sut.onUpdate = { result = $0 }
        sut.onAppear()
        XCTAssertEqual(try? result?.get(), [IndexListItemViewModel(.strava)])
    }

    func testSelectionAtIndexPath() throws {
        var heading: Heading?
        let sut = IndexListController(repository: LocalIndexRepository(headings: [.rockets, .strava]))
        sut.onSelect = { heading = $0 }
        sut.onAppear()
        sut.selectItem(at: IndexPath(row: 1, section: 0))
        XCTAssertEqual(heading, .strava)
    }
}
