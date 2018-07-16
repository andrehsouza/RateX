//
//  RFenceView..swift
//  RateX
//
//  Created by Andre on 11/06/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import UIKit

class RFenceView: UIView {

    @IBOutlet weak var loadingView: RCardView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var btRetry: RButton!
    @IBOutlet weak var messageLbl: UILabel!
    
    @IBAction func touchRetry(_ sender: Any) {
        showFenceLoadingView()
    }
    
}

extension RFenceView {
    
    func showFenceLoadingView() {
        errorView.isHidden = true
        loadingView.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func showErrorView(error: ErrorInterface, target: Any, action:Selector) {
        errorView.isHidden = error.hideButton
        messageLbl.text = error.message
        loadingView.isHidden = true
        btRetry.removeTarget(nil, action: nil, for: .allEvents)
        btRetry.addTarget(target, action: action, for: .touchUpInside)
        btRetry.setTitle(error.buttonText, for: .normal)
        activityIndicator.stopAnimating()
    }
    
}
