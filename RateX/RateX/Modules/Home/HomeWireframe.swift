//
//  HomeWireframe.swift
//  RateX
//
//  Created by Andre Souza on 16/07/2018.
//  Copyright (c) 2018 Andre. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HomeWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let _storyboard = UIStoryboard(type: .home)

    // MARK: - Module setup -

    init() {
        let moduleViewController = _storyboard.instantiateViewController(ofType: HomeViewController.self)
        super.init(viewController: moduleViewController)
        
        let interactor = HomeInteractor()
        let presenter = HomePresenter(wireframe: self, view: moduleViewController, interactor: interactor)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension HomeWireframe: HomeWireframeInterface {

    func navigate(to option: HomeNavigationOption) {
        
    }
}
