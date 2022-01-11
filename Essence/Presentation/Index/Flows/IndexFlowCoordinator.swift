//
//  IndexFlowCoordinator.swift
//  Essence
//
//  Created by Jans Pavlovs on 11/11/2021.
//

import SwiftUI

// MARK: Initialization

final class IndexFlowCoordinator {
    private let router: Router
    private let indexFlowFactory: IndexFlowFactory

    init(router: Router, indexFlowFactory: IndexFlowFactory) {
        self.router = router
        self.indexFlowFactory = indexFlowFactory
    }
}

// MARK: Coordinator

extension IndexFlowCoordinator: Coordinator {
    func start(animated: Bool) {
        showIndexList(animated: animated)
    }

    func showIndexList(animated: Bool) {
        let repository = indexFlowFactory.createIndexRepository()
        let viewModel = IndexListController(repository: repository)
        let viewModelWrapper = IndexListViewModelWrapper(viewModel: viewModel)
        let indexView = IndexListView(viewModelWrapper: viewModelWrapper)
        let viewController = UIHostingController(rootView: indexView)
        router.push(viewController, animated: animated)
    }
}
