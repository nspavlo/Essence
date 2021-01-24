//
//  UITableViewCell+Rockets.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Configuration

extension UITableViewCell {
    func configure(with viewModel: RocketsListItemViewModel) {
        textLabel?.text = viewModel.title
    }
}
