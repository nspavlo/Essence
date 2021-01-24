//
//  UITableView+Reusable.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Registration

// https://tinyurl.com/yyp4n4kn

extension UITableView {
    func register<T: UITableViewCell>(cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
}

// MARK: Dequeue

extension UITableView {
    // swiftlint:disable line_length
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) "
                    + "matching type \(cellType.self). "
                    + "Check that you registered the cell beforehand"
            )
        }

        return cell
    }
}
