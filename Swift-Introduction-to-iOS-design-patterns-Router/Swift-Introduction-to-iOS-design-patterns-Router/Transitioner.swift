//
//  Transitioner.swift
//  Swift-Introduction-to-iOS-design-patterns-Router
//
//  Created by kazunori.aoki on 2021/10/13.
//

import UIKit

// whereを使うことにより、UIViewControllerに限定できる
protocol Transitioner where Self: UIViewController {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func popViewController(animated: Bool)
    func popToRootViewController(animated: Bool)
    func popToViewController(_ viewController: UIViewController, animated: Bool)
    func present(viewController: UIViewController, animated: Bool, completion: (() -> ())?)
    func dismiss(animated: Bool)
}

extension Transitioner {
    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        guard let nc = navigationController else { return } // FIXME: 強制アンラップで落としたほうがいい？
        nc.pushViewController(viewController, animated: animated)
    }
    
    func popViewController(animated: Bool) {}

    func popToRootViewController(animated: Bool) {}

    func popToViewController(_ viewController: UIViewController, animated: Bool) {}

    func present(viewController: UIViewController, animated: Bool, completion: (() -> ())? = nil) {
        present(viewController, animated: animated, completion: completion)
    }

    func dismiss(animated: Bool) {
        dismiss(animated: animated)
    }
}
