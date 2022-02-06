//
//  RocketsContainerViewControllerTest.swift
//  EssenceUnitTests
//
//  Created by Jans Pavlovs on 30/01/2021.
//

import XCTest

@testable import Essence

// MARK: XCTestCase

final class RocketsContainerViewControllerTest: XCTestCase {
    func test_binding_withViewDidLoad_shouldExecuteOnAppearOnce() {
        let viewModel = SpyRocketsListViewModel()
        let sut = RocketsContainerViewController(viewModel: viewModel)

        // Trigger `viewDidLoad`
        _ = sut.view.bounds

        XCTAssertEqual(viewModel.onAppearExecutionCount, 1)
    }

    func test_binding_withViewDidLoad_shouldSubscribeForUpdates() {
        let viewModel = SpyRocketsListViewModel()
        let sut = RocketsContainerViewController(viewModel: viewModel)

        // Trigger `viewDidLoad`
        _ = sut.view.bounds

        XCTAssertNotNil(viewModel.onUpdate)
    }

    func test_binding_withViewDidLoad_shouldContainGivenTitle() {
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

    var viewDidLoadExecutionCount = 0
    var didSelectItemExecutionCount = 0
}

// MARK: RocketsListViewModelInput

extension SpyRocketsListViewModel: RocketsListViewModelInput {
    func viewDidLoad() {
        viewDidLoadExecutionCount += 1
    }

    func selectItem(at _: IndexPath) {
        didSelectItemExecutionCount += 1
    }
}
