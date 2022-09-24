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
        let heading: Heading = .rockets
        let sut = IndexListController(repository: LocalIndexRepository(headings: [heading]))
        sut.onUpdate = { result = $0 }

        sut.onAppear()

        XCTAssertEqual(try? result?.get(), [IndexListItemViewModel(heading)])
    }

    func test_onAppear_withCorruptedRepository_shouldReturnFailure() {
        var result: Result<IndexListItemViewModels, IndexListError>?
        let sut = IndexListController(repository: CorruptedIndexRepository())
        sut.onUpdate = { result = $0 }

        sut.onAppear()

        var thrownError: Error?
        XCTAssertThrowsError(try result?.get()) { thrownError = $0 }
        XCTAssertTrue(thrownError is IndexListError)
    }

    func test_selection_whenFirstIndexSelected_shouldReturnFirstHeading() {
        var heading: Heading?
        let headings: Headings = [.rocketsLegacy, .rockets]
        let index = 1
        let sut = IndexListController(repository: LocalIndexRepository(headings: headings))
        sut.onSelect = { heading = $0 }

        sut.onAppear()
        sut.selectItem(at: IndexPath(row: index, section: 0))

        XCTAssertEqual(heading, headings[index])
    }
}

// MARK: Error

struct CorruptedIndexRepository: IndexRepository {
    func fetch(with completion: @escaping (Result<Headings, RequestError>) -> Void) -> Cancellable? {
        completion(.failure(.error(code: 403, data: nil)))
        return nil
    }
}
