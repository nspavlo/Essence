//
//  RocketsErrorViewController.swift
//  SpaceX
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Initialization

final class RocketsErrorViewController: UIViewController {
    private let label = UILabel()
    private let error: Error

    init(error: Error) {
        self.error = error
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = error.localizedDescription
        label.textAlignment = .center
        label.numberOfLines = 0
        view.addSubview(label)
    }

    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        label.frame = view.bounds.insetBy(dx: 16, dy: 16)
    }
}
