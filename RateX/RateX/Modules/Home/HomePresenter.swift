//
//  HomePresenter.swift
//  RateX
//
//  Created by Andre Souza on 16/07/2018.
//  Copyright (c) 2018 Andre. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HomePresenter {

    // MARK: - Private properties -

    private unowned var _view: HomeViewInterface
    private var _interactor: HomeInteractorInterface
    private var _wireframe: HomeWireframeInterface

    // MARK: - Lifecycle -

    init(wireframe: HomeWireframeInterface, view: HomeViewInterface, interactor: HomeInteractorInterface) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
    }
}

// MARK: - Extensions -

extension HomePresenter: HomePresenterInterface {
}