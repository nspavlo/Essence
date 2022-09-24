//
//  RocketsTableViewCellTest.swift
//  EssenceUnitTests
//
//  Created by Jans Pavlovs on 11/01/2022.
//

import XCTest

@testable import Essence

// MARK: XCTestCase

final class RocketsTableViewCellTest: XCTestCase {
    func test_init_withoutItemViewModel_shouldContainEmptyTitle() {
        let sut = RocketsTableViewCell(style: .subtitle, reuseIdentifier: nil)

        XCTAssertNil(sut.listContentConfiguration?.text)
    }

    func test_init_withoutItemViewModel_shouldContainEmptySubtitle() {
        let sut = RocketsTableViewCell(style: .subtitle, reuseIdentifier: nil)

        XCTAssertNil(sut.listContentConfiguration?.secondaryText)
    }

    func test_init_withoutItemViewModel_shouldContainAccessoryTypeNone() {
        let sut = RocketsTableViewCell(style: .subtitle, reuseIdentifier: nil)

        XCTAssertEqual(sut.accessoryType, .none)
    }

    func test_configure_withItemViewModel_shouldContainGivenTitle() {
        let (viewModel, sut) = createSystemComponents()

        sut.configure(with: viewModel)

        XCTAssertEqual(sut.listContentConfiguration?.text, viewModel.title)
    }

    func test_configure_withItemViewModel_shouldContainGivenSubtitle() {
        let (viewModel, sut) = createSystemComponents()

        sut.configure(with: viewModel)

        XCTAssertEqual(sut.listContentConfiguration?.secondaryText, viewModel.subtitle)
    }

    func test_configure_withItemViewModel_shouldContainAccessoryTypeDisclosureIndicator() {
        let (viewModel, sut) = createSystemComponents()

        sut.configure(with: viewModel)

        XCTAssertEqual(sut.accessoryType, .disclosureIndicator)
    }
}

// MARK: Factory

private extension RocketsTableViewCellTest {
    func createSystemComponents(
        file: StaticString = #file,
        line: UInt = #line
    ) -> (RocketsListItemViewModel, RocketsTableViewCell) {
        let viewModel: RocketsListItemViewModel = .stub()
        let sut = RocketsTableViewCell(style: .subtitle, reuseIdentifier: nil)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (viewModel, sut)
    }
}

// MARK: UIListContentConfiguration

private extension RocketsTableViewCell {
    var listContentConfiguration: UIListContentConfiguration? {
        contentConfiguration as? UIListContentConfiguration
    }
}
