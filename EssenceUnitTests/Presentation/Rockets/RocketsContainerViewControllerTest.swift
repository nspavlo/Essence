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
