//
//  RocketsTableViewCell.swift
//  Essence
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Initialization

final class RocketsTableViewCell: UITableViewCell {}

// MARK: Configuration

extension RocketsTableViewCell {
    func configure(with viewModel: RocketsListItemViewModel) {
        var content = defaultContentConfiguration()
        content.text = viewModel.title
        content.secondaryText = viewModel.subtitle
        contentConfiguration = content
        accessoryType = .disclosureIndicator
    }
}
