//
//  RocketsContainerViewControllerTest.swift
//  SpaceXTests
//
//  Created by Jans Pavlovs on 30/01/2021.
//

import XCTest

@testable import SpaceX

// MARK: Test

class RocketsContainerViewControllerTest: XCTestCase {
    func testViewDidLoadBinding() throws {
        let viewModel = SpyRocketsListViewModel()
        let sut = RocketsContainerViewController(viewModel: viewModel)
        sut.viewDidLoad()
        XCTAssertEqual(viewModel.viewDidLoadExecutionCount, 1)
    }
}

// MARK: -

// MARK: Initialization

final class SpyRocketsListViewModel: RocketsListViewModelOutput {
    var changeState: ((RocketsListViewModelState) -> Void)?

    var viewDidLoadExecutionCount = 0
    var didSelectItemExecutionCount = 0
}

// MARK: RocketsListViewModelInput

extension SpyRocketsListViewModel: RocketsListViewModelInput {
    func viewDidLoad() {
        viewDidLoadExecutionCount += 1
    }

    func didSelectItem(at indexPath: IndexPath) {
        didSelectItemExecutionCount += 1
    }
}
