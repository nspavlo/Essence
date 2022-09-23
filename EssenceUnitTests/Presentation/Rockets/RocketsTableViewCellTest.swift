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
        let sut = RocketsTableViewCell(style: .subtitle, reuseIdentifier: nil)
        let viewModel = RocketsListItemViewModel(title: "Index", subtitle: "Latvia")

        sut.configure(with: viewModel)
        
        XCTAssertEqual(sut.listContentConfiguration?.text, viewModel.title)
    }

    func test_configure_withItemViewModel_shouldContainGivenSubtitle() {
        let sut = RocketsTableViewCell(style: .subtitle, reuseIdentifier: nil)
        let viewModel = RocketsListItemViewModel(title: "Index", subtitle: "Latvia")

        sut.configure(with: viewModel)

        XCTAssertEqual(sut.listContentConfiguration?.secondaryText, viewModel.subtitle)
    }
    
    func test_configure_withItemViewModel_shouldContainAccessoryTypeDisclosureIndicator() {
        let sut = RocketsTableViewCell(style: .subtitle, reuseIdentifier: nil)
        let viewModel = RocketsListItemViewModel(title: "Index", subtitle: "Latvia")

        sut.configure(with: viewModel)

        XCTAssertEqual(sut.accessoryType, .disclosureIndicator)
    }
}

// MARK: UIListContentConfiguration

private extension RocketsTableViewCell {
    var listContentConfiguration: UIListContentConfiguration? {
        contentConfiguration as? UIListContentConfiguration
    }
}
