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

        XCTAssertNil(sut.textLabel?.text)
    }

    func test_init_withoutItemViewModel_shouldContainEmptySubtitle() {
        let sut = RocketsTableViewCell(style: .subtitle, reuseIdentifier: nil)

        XCTAssertNil(sut.detailTextLabel?.text)
    }

    func test_configure_withItemViewModel_shouldContainGivenTitle() {
        let sut = RocketsTableViewCell(style: .subtitle, reuseIdentifier: nil)
        let viewModel = RocketsListItemViewModel(title: "Index", subtitle: "Latvia")

        sut.configure(with: viewModel)

        XCTAssertEqual(sut.textLabel?.text, viewModel.title)
    }

    func test_configure_withItemViewModel_shouldContainGivenSubtitle() {
        let sut = RocketsTableViewCell(style: .subtitle, reuseIdentifier: nil)
        let viewModel = RocketsListItemViewModel(title: "Index", subtitle: "Latvia")

        sut.configure(with: viewModel)

        XCTAssertEqual(sut.detailTextLabel?.text, viewModel.subtitle)
    }
}
