//
//  RocketsContainerViewController.swift
//  Essence
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Initialization

final class RocketsContainerViewController: UIViewController {
    private let viewModel: RocketsListViewModel

    init(viewModel: RocketsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.viewDidLoad()
    }
}

// MARK: Private Methods

private extension RocketsContainerViewController {
    func setup() {
        setupViews()
        setupBindings()
    }

    func setupViews() {
        title = viewModel.title
        view.backgroundColor = .systemBackground
    }

    func setupBindings() {
        viewModel.onUpdate = { [weak self] state in
            self?.render(state)
        }
    }

    func render(_ state: RocketsListViewModelState) {
        switch state {
        case .loading:
            showLoaderView()
        case .result(.success(let items)):
            showList(with: items)
        case .result(.failure(let error)):
            showErrorView(with: error)
        }
    }
}

// MARK: Views

private extension RocketsContainerViewController {
    func showLoaderView() {
        let viewController = LoaderViewController()
        replaceExisting(with: viewController, in: view)
    }

    func showList(with items: RocketsListItemViewModels) {
        let viewController = RocketsTableViewController(items: items)
        viewController.didSelectItem = viewModel.selectItem(at:)
        replaceExisting(with: viewController, in: view)
    }

    func showErrorView(with error: Error) {
        let viewController = ErrorViewController(error: error)
        replaceExisting(with: viewController, in: view)
    }
}
