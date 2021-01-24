//
//  RocketsTableViewController.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Initialization

final class RocketsTableViewController: UITableViewController {
    let items: RocketsListItemViewModels
    var didSelectItem: ((IndexPath) -> Void)?

    init(items: RocketsListItemViewModels) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cellType: RocetsTableViewCell.self)
    }
}

// MARK: UITableViewDataSource, UITableViewDelegate
// https://www.swiftbysundell.com/articles/reusable-data-sources-in-swift/

extension RocketsTableViewController {
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> RocetsTableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RocetsTableViewCell
        cell.configure(with: items[indexPath.row])
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectItem?(indexPath)
    }
}
