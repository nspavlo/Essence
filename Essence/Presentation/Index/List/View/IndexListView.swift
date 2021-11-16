//
//  IndexListView.swift
//  Essence
//
//  Created by Jans Pavlovs on 11/11/2021.
//

import SwiftUI

// MARK: - View

struct IndexListView: View {
    @ObservedObject
    var viewModelWrapper: IndexListViewModelWrapper

    var body: some View {
        List(viewModelWrapper.items) { item in
            Text(item.title)
        }
        .onAppear {
            self.viewModelWrapper.onAppear()
        }
    }
}

// MARK: - Wrapper

final class IndexListViewModelWrapper: ObservableObject {
    private let viewModel: IndexListViewModel

    @Published
    var items: IndexListItemViewModels = []

    init(viewModel: IndexListViewModel) {
        self.viewModel = viewModel
        self.viewModel.onUpdate = { [weak self] items in
            self?.items = items
        }
    }

    func onAppear() {
        viewModel.onAppear()
    }
}
