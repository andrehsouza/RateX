//
//  HomeInterfaces.swift
//  RateX
//
//  Created by Andre Souza on 16/07/2018.
//  Copyright (c) 2018 Andre. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum LayoutLocation {
    case top
    case bottom
}

enum HomeNavigationOption {
}

protocol HomeWireframeInterface: WireframeInterface {
    func navigate(to option: HomeNavigationOption)
}

protocol HomeViewInterface: ViewInterface {
    func showSelectedCurrency(_ currency: CurrencyListItemInterface, location: LayoutLocation)
    func showOrHideTableView(_ location: LayoutLocation)
    func showLoading(_ loading: Bool)
    func showError(error: ErrorInterface, target: Any, action: Selector)
    func reloadDatas()
    func enableCurrencyButtonBottom()
    var topTextFieldText: String? { get set }
    var bottomTextFieldText: String? { get set }
    var date: String { get set }
    var rate: String { get set }
}

protocol HomePresenterInterface: PresenterInterface {
    func showCurrencyRatesInfo()
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> CurrencyListItemInterface?
    func didSelectTopItem(at indexPath: IndexPath)
    func didSelectBottomItem(at indexPath: IndexPath)
    func didTouchButtonCurrency(_ location: LayoutLocation)
    func editingChanged(_ text: String?)
}

protocol HomeInteractorInterface: InteractorInterface {
    func getCurrencies(base currency: Currency, completion: @escaping (RequestResultType<CurrencyRates>) -> Void)
}

protocol CurrencyListItemInterface {
    var title: String? { get }
}
