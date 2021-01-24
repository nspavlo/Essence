//
//  RocetsTableViewCell.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Initialization

final class RocetsTableViewCell: UITableViewCell {}

// MARK: Reusable

extension RocetsTableViewCell: Reusable {}

// MARK: Configuration

extension RocetsTableViewCell {
    func configure(with viewModel: RocketsListItemViewModel) {
        textLabel?.text = viewModel.title
    }
}
