//
//  RocketsListControllerTest.swift
//  EssenceUnitTests
//
//  Created by Jans Pavlovs on 11/01/2022.
//

import XCTest

@testable import Essence

// MARK: Test

final class RocketsListControllerTest: XCTestCase {
    func testOnAppearLoadingState() throws {
        var state: RocketsListViewModelState?
        let sut = RocketsListController(repository: NonRespondingRocketsRepository())
        sut.changeState = { state = $0 }
        sut.onAppear()
        XCTAssertEqual(state, .loading)
    }

    func testOnAppearLResultState() throws {
        var state: RocketsListViewModelState?
        let sut = RocketsListController(repository: LocalRocketsRepository())
        sut.changeState = { state = $0 }
        sut.onAppear()

        guard case let .result(result) = state, let viewModels = try? result.get() else {
            XCTFail("Expected success, but was \(String(describing: state))")
            return
        }

        XCTAssertEqual(viewModels.count, 2)
    }

    func testSelectionAtIndexPath() throws {
        var rocket: Rocket?
        let sut = RocketsListController(repository: LocalRocketsRepository())
        sut.showRocketDetails = { rocket = $0 }
        sut.onAppear()
        sut.selectItem(at: IndexPath(row: 1, section: 0))
        XCTAssertEqual(rocket, .stub(id: "2"))
    }
}

// MARK: -

// MARK: Repositories

final class NonRespondingRocketsRepository: RocketsRepository {
    func fetch(
        with _: @escaping (Result<Rockets, RequestError>) -> Void
    ) -> Cancellable? {
        nil
    }
}

final class LocalRocketsRepository: RocketsRepository {
    func fetch(
        with completion: @escaping (Result<Rockets, RequestError>) -> Void
    ) -> Cancellable? {
        let rockets: Rockets = [
            .stub(id: "1"),
            .stub(id: "2")
        ]
        completion(.success(rockets))
        return nil
    }
}

// MARK: Extensions

extension RocketsListError: Equatable {
    public static func == (lhs: RocketsListError, rhs: RocketsListError) -> Bool {
        "\(lhs)" == "\(rhs)"
    }
}
extension RocketsListViewModelState: Equatable {
    public static func == (lhs: RocketsListViewModelState, rhs: RocketsListViewModelState) -> Bool {
        switch (lhs, rhs) {
        case (.result(let lhs), .result(let rhs)):
            return lhs == rhs
        case (.loading, .result):
            return false
        case (.result, .loading):
            return false
        case (.loading, .loading):
            return true
        }
    }
}