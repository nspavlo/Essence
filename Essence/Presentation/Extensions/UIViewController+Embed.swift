//
//  UIViewController+Embed.swift
//  Essence
//
//  Created by Jans Pavlovs on 23/01/2021.
//

import UIKit

// MARK: Embed

extension UIViewController {
    func embed(_ child: UIViewController, in container: UIView) {
        addChild(child)
        child.view.frame = container.bounds
        container.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }

    func replaceExisting(with child: UIViewController, in container: UIView) {
        children.forEach { $0.remove() }
        embed(child, in: container)
    }
}
