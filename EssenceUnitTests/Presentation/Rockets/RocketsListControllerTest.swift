//
//  RocketsListControllerTest.swift
//  EssenceUnitTests
//
//  Created by Jans Pavlovs on 11/01/2022.
//

import XCTest

@testable import Essence

// MARK: XCTestCase

final class RocketsListControllerTest: XCTestCase {
    func test_onAppear_shouldChangeToLoadingState() {
        var state: RocketsListViewModelState?
        let sut = RocketsListController(repository: NonRespondingRocketsRepository())
        sut.onUpdate = { state = $0 }

        sut.viewDidLoad()

        XCTAssertEqual(state, .loading)
    }

    func test_onAppear_withNonEmptyRepository_shouldReturnSuccess() {
        var state: RocketsListViewModelState?
        let rockets: Rockets = [.stub(id: "1"), .stub(id: "2")]
        let sut = RocketsListController(repository: LocalRocketsRepository(rockets: rockets))
        sut.onUpdate = { state = $0 }

        sut.viewDidLoad()

        if case let .result(result) = state, let viewModels = try? result.get() {
            XCTAssertEqual(viewModels.count, rockets.count)
        } else {
            XCTFail("Expected success, but was \(String(describing: state))")
        }
    }

    func test_selection_whenFirstIndexSelected_shouldReturnFirstRocket() {
        var rocket: Rocket?
        let rockets: Rockets = [.stub(id: "1"), .stub(id: "2")]
        let index = 1
        let sut = RocketsListController(repository: LocalRocketsRepository(rockets: rockets))
        sut.onUpdate = { _ in }
        sut.showRocketDetails = { rocket = $0 }

        sut.viewDidLoad()
        sut.selectItem(at: IndexPath(row: index, section: 0))

        XCTAssertEqual(rocket, rockets[index])
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
    private let rockets: Rockets

    init(rockets: Rockets) {
        self.rockets = rockets
    }

    func fetch(
        with completion: @escaping (Result<Rockets, RequestError>) -> Void
    ) -> Cancellable? {
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
