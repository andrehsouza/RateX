//
//  BaseWireframe.swift
//  RateX
//
//  Created by Andre Souza on 06/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation
import UIKit

enum Transition {
    case root
    case push
    case present(complation: (() -> Void)?)
}

protocol WireframeInterface: class {
    func popFromNavigationController(animated: Bool)
    func dismiss(animated: Bool)
    func show(_ wireframe: BaseWireframe, with transition: Transition, animated: Bool)
    func show(_ viewController: UIViewController, with transition: Transition, animated: Bool)
    func showErrorAlert(with message: String?)
    func showAlert(with title: String?, message: String?)
    func showAlert(with title: String?, message: String?, actions: [UIAlertAction])
}

class BaseWireframe {
    
    fileprivate unowned var _viewController: UIViewController
    
    init(viewController: UIViewController) {
        _viewController = viewController
    }
    
}

extension BaseWireframe {
    
    var viewController: UIViewController {
        return _viewController
    }
    
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
    
}

extension BaseWireframe: WireframeInterface {
    
    func popFromNavigationController(animated: Bool) {
        let _ = navigationController?.popViewController(animated: animated)
    }
    
    func dismiss(animated: Bool) {
        navigationController?.dismiss(animated: animated)
    }
    
    func show(_ wireframe: BaseWireframe, with transition: Transition, animated: Bool) {
        switch transition {
        case .push:
            navigationController?.pushWireframe(wireframe, animated: animated)
        case .present(let complation):
            let navigationController = RNavigationController()
            navigationController.setRootWireframe(wireframe)
            _viewController.present(navigationController, animated: animated, completion: complation)
        case .root:
            navigationController?.setRootWireframe(wireframe, animated: animated)
        }
    }
    
    func show(_ viewController: UIViewController, with transition: Transition, animated: Bool) {
        switch transition {
        case .push:
            navigationController?.pushViewController(viewController, animated: animated)
        case .present(let complation):
            _viewController.present(viewController, animated: animated, completion: complation)
            if let popOver = viewController.popoverPresentationController {
                popOver.sourceView = _viewController.view
                if let rightBarbuttons = _viewController.navigationItem.rightBarButtonItems {
                    popOver.barButtonItem = rightBarbuttons[rightBarbuttons.count - 1]
                }
            }
        case .root:
            navigationController?.setViewControllers([viewController], animated: animated)
        }
    }
    
    func showErrorAlert(with message: String?) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(with: "Something went wrong", message: message, actions: [okAction])
    }
    
    func showAlert(with title: String?, message: String?) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(with: title, message: message, actions: [okAction])
    }
    
    func showAlert(with title: String?, message: String?, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        alert.view.tintColor = .mainColor
        navigationController?.present(alert, animated: true, completion: nil)
    }

}
