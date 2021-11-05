//
//  RocketsTableViewCell.swift
//  Essence
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Initialization

final class RocketsTableViewCell: UITableViewCell {}

// MARK: Reusable

extension RocketsTableViewCell: Reusable {}

// MARK: Configuration

extension RocketsTableViewCell {
    func configure(with viewModel: RocketsListItemViewModel) {
        textLabel?.text = viewModel.title
        accessoryType = .disclosureIndicator
    }
}
