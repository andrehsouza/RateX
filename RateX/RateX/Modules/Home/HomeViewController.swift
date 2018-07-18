//
//  HomeViewController.swift
//  RateX
//
//  Created by Andre Souza on 16/07/2018.
//  Copyright (c) 2018 Andre. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HomeViewController: RBaseViewController {
    
    @IBOutlet weak var cardTopView: RCardView!
    @IBOutlet weak var cardBottomView: RCardView!
    
    @IBOutlet weak var currencyButtonTop: RButton!
    @IBOutlet weak var currencyButtonBottom: RButton!
    
    @IBOutlet weak var tableViewTop: UITableView!
    @IBOutlet var tableViewTopHeight: NSLayoutConstraint!
    @IBOutlet weak var tableViewBottom: UITableView!
    @IBOutlet var tableViewBottomHeight: NSLayoutConstraint!
    
    @IBOutlet weak var textFieldTop: UITextField!
    @IBOutlet weak var textFieldBottom: UITextField!
    
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var updateLabel: UILabel!
    
    private var arrowTransformClosed = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
    
    // MARK: - Public properties -

    var presenter: HomePresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViews()
        presenter.viewDidLoad()
    }
    
    @IBAction func touchDown(_ sender: UIButton) {
        animTouch(sender, scaledDefault: false)
    }
    
    @IBAction func buttonRelease(_ sender: UIButton) {
        animTouch(sender, scaledDefault: true)
    }
    
    @IBAction func touchCurrency(_ sender: UIButton) {
        animTouch(sender, scaledDefault: true)
        let location: LayoutLocation = (sender == currencyButtonTop) ? .top : .bottom
        presenter.didTouchButtonCurrency(location)
    }
    
    @IBAction func editingChanged(_ sender: Any) {
        presenter.editingChanged(textFieldTop.text)
    }
    
    @IBAction func touchRefresh(_ sender: Any) {
        presenter.didPressRefresh()
    }
    
	
}

// MARK: - Funcs -

extension HomeViewController {
    
    private func setupTableViews() {
        tableViewTop.register(CurrencyTableViewCell.self)
        tableViewBottom.register(CurrencyTableViewCell.self)
        tableViewTop.delegate = self
        tableViewTop.dataSource = self
        tableViewBottom.delegate = self
        tableViewBottom.dataSource = self
    }
    
    private func animTouch(_ sender: UIButton, scaledDefault: Bool) {
        let carToAnim = (sender == currencyButtonTop) ? cardTopView : cardBottomView
        carToAnim?.transform = scaledDefault ? CGAffineTransform(scaleX: 1.0, y: 1.0) : CGAffineTransform(scaleX: 0.98, y: 0.98)
    }
    
}

// MARK: - UITableViewDataSource -

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as CurrencyTableViewCell
        cell.titleLabel.text = presenter.item(at: indexPath)?.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}

// MARK: - UITableViewDelegate -

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView == tableViewTop {
            presenter.didSelectTopItem(at: indexPath)
        } else {
            presenter.didSelectBottomItem(at: indexPath)
        }
    }
    
}

// MARK: - Extensions -

extension HomeViewController: HomeViewInterface {
    
    var date: String {
        get {
            return updateLabel.text ?? ""
        }
        set {
            updateLabel.text = newValue
        }
    }
    
    var rate: String {
        get {
            return rateLabel.text ?? ""
        }
        set {
            rateLabel.text = newValue
        }
    }
    
    var topTextFieldText: String? {
        get {
            return textFieldTop.text
        }
        set {
            textFieldTop.text = newValue
        }
    }
    
    var bottomTextFieldText: String? {
        get {
            return textFieldBottom.text
        }
        set {
            textFieldBottom.text = newValue
        }
    }
    
    func showLoading(_ loading: Bool) {
        if loading {
            showFenceLoading()
        } else {
            hideFenceView()
        }
    }
    
    func showError(error: ErrorInterface, target: Any, action: Selector) {
        showFenceError(error: error, target: target, action: action)
    }
    
    func showSelectedCurrency(_ currency: CurrencyListItemInterface, location: LayoutLocation) {
        if location == .top {
            currencyButtonTop.setTitle(currency.title, for: .normal)
        } else {
            currencyButtonBottom.setTitle(currency.title, for: .normal)
        }
    }
    
    func showOrHideTableView(_ location: LayoutLocation) {
        
        UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [.curveEaseInOut], animations: {
            if location == .top {
                let isOpened = (self.tableViewTopHeight.constant > 0)
                self.currencyButtonTop.imageView?.transform = isOpened ? CGAffineTransform.identity : self.arrowTransformClosed
                self.tableViewTopHeight.constant = isOpened ? 0 : 440
                self.tableViewBottomHeight.constant =  0
                self.currencyButtonBottom.imageView?.transform = CGAffineTransform.identity
            } else {
                let isOpened = (self.tableViewBottomHeight.constant > 0)
                self.currencyButtonBottom.imageView?.transform = isOpened ? CGAffineTransform.identity : self.arrowTransformClosed
                self.tableViewBottomHeight.constant = isOpened ? 0 : 440
                self.tableViewTopHeight.constant = 0
                self.currencyButtonTop.imageView?.transform = CGAffineTransform.identity
            }
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    func reloadDatas() {
        tableViewTop.reloadData()
        tableViewBottom.reloadData()
    }
    
    func enableCurrencyButtonBottom(_ enabled: Bool) {
        currencyButtonBottom.isEnabled = enabled
    }
    
    func clearSelecionsTitle() {
        currencyButtonTop.setTitle("Select a currency", for: .normal)
        currencyButtonBottom.setTitle("Select a currency", for: .normal)
    }
    
}
