//
//  RocketsTableViewController.swift
//  Essence
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
        tableView.register(cellType: RocketsTableViewCell.self)
    }
}

// MARK: UITableViewDataSource

extension RocketsTableViewController {
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as RocketsTableViewCell
        cell.configure(with: items[indexPath.row])
        return cell
    }
}

// MARK: UITableViewDelegate

extension RocketsTableViewController {
    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectItem?(indexPath)
    }
}
