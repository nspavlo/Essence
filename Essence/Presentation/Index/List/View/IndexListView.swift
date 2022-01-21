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
            Button(item.title) {
                self.viewModelWrapper.didSelect(item)
            }
        }
        .navigationTitle(Locale.title)
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
            self?.items = (try? items.get()) ?? []
        }
    }

    func onAppear() {
        viewModel.onAppear()
    }

    func didSelect(_ item: IndexListItemViewModel) {
        guard let index = items.firstIndex(where: { $0 == item }) else {
            fatalError("Unknown item: \(item), in: \(items)")
        }

        viewModel.selectItem(at: IndexPath(row: index, section: 0))
    }
}

// MARK: Locale

private typealias Locale = String

private extension Locale {
    static let title = "Essence Index"
}
