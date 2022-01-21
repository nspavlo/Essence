//
//  RocketsContainerViewControllerTest.swift
//  EssenceUnitTests
//
//  Created by Jans Pavlovs on 30/01/2021.
//

import XCTest

@testable import Essence

// MARK: Test

final class RocketsContainerViewControllerTest: XCTestCase {
    func testViewModelBindingOnViewDidLoad() throws {
        let viewModel = SpyRocketsListViewModel()
        let sut = RocketsContainerViewController(viewModel: viewModel)

        // Trigger `viewDidLoad`
        _ = sut.view.bounds

        XCTAssertEqual(viewModel.onAppearExecutionCount, 1)
    }

    func testStateChangeBindingOnViewDidLoad() throws {
        let viewModel = SpyRocketsListViewModel()
        let sut = RocketsContainerViewController(viewModel: viewModel)

        // Trigger `viewDidLoad`
        _ = sut.view.bounds

        XCTAssertNotNil(viewModel.onUpdate)
    }

    func testTitleSetupOnViewDidLoad() throws {
        let viewModel = SpyRocketsListViewModel()
        let sut = RocketsContainerViewController(viewModel: viewModel)

        // Trigger `viewDidLoad`
        _ = sut.view.bounds

        XCTAssertEqual(sut.title, "Rockets")
    }
}

// MARK: -

// MARK: Initialization

final class SpyRocketsListViewModel: RocketsListViewModelOutput {
    var onUpdate: ((RocketsListViewModelState) -> Void)?

    var onAppearExecutionCount = 0
    var didSelectItemExecutionCount = 0
}

// MARK: RocketsListViewModelInput

extension SpyRocketsListViewModel: RocketsListViewModelInput {
    func onAppear() {
        onAppearExecutionCount += 1
    }

    func selectItem(at _: IndexPath) {
        didSelectItemExecutionCount += 1
    }
}
