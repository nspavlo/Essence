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
    func test_binding_withViewDidLoad_shouldExecuteOnce() {
        let (viewModel, sut) = createSystemComponents()

        // Trigger `viewDidLoad`
        _ = sut.view.bounds

        XCTAssertEqual(viewModel.viewDidLoadExecutionCount, 1)
    }

    func test_binding_withViewDidLoad_shouldSubscribeForUpdates() {
        let (viewModel, sut) = createSystemComponents()

        sut.viewDidLoad()

        XCTAssertNotNil(viewModel.onUpdate)
    }

    func test_binding_withViewDidLoad_shouldContainGivenTitle() {
        let (viewModel, sut) = createSystemComponents()

        sut.viewDidLoad()

        XCTAssertEqual(sut.title, viewModel.title)
    }

    func test_binding_withViewDidLoad_shouldContainGivenBackgroundColor() {
        let (_, sut) = createSystemComponents()

        sut.viewDidLoad()

        XCTAssertNotNil(sut.view.backgroundColor)
    }
}

// MARK: Factory

private extension RocketsContainerViewControllerTest {
    func createSystemComponents(
        file: StaticString = #file,
        line: UInt = #line
    ) -> (SpyRocketsListViewModel, RocketsContainerViewController) {
        let viewModel = SpyRocketsListViewModel()
        trackForMemoryLeaks(viewModel, file: file, line: line)
        let sut = RocketsContainerViewController(viewModel: viewModel)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (viewModel, sut)
    }
}

// MARK: -

// MARK: Initialization

final class SpyRocketsListViewModel: RocketsListViewModelOutput {
    var title: String { "Test" }
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
