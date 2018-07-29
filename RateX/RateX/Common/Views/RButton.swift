//
//  RButton.swift
//  RateX
//
//  Created by Andre Souza on 09/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import UIKit

@IBDesignable
class RButton: UIButton {
    
    private var originalButtonText: String?
    private var activityIndicator: UIActivityIndicatorView!

    @IBInspectable var fillColor: UIColor? = UIColor.white {
        didSet {
            updateViewsFromIB()
        }
    }
    
    @IBInspectable var activityColor: UIColor? = UIColor.black {
        didSet {
            updateViewsFromIB()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            updateViewsFromIB()
        }
    }
    
    @IBInspectable var shadowColor: UIColor? = UIColor.clear {
        didSet {
            updateViewsFromIB()
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet {
            updateViewsFromIB()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            updateViewsFromIB()
        }
    }
    
    @IBInspectable var borderColor: UIColor? = UIColor.clear {
        didSet {
            updateViewsFromIB()
        }
    }
    
    override public var isEnabled: Bool {
        didSet {
            if(isEnabled) {
                alpha = 1
            } else {
                alpha = 0.4
            }
        }
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateViewsFromIB()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
}

extension RButton: BaseViewProtocol {
    
    func setupView() {
        
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor?.cgColor
        layer.masksToBounds = false
        layer.borderWidth = borderWidth
        layer.backgroundColor = fillColor?.cgColor
        
        //Shadow
        let shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = cornerRadius
        layer.shadowPath = shadowPath
        layer.shouldRasterize = true
        
        if(isEnabled) {
            alpha = 1
        } else {
            alpha = 0.4
        }
    }
    
}

//MARK: - Loading -

extension RButton {
    
    func showLoading() {
        originalButtonText = titleLabel?.text
        setTitle("", for: .normal)
        
        if (activityIndicator == nil) {
            activityIndicator = createActivityIndicator()
        }
        
        showSpinning()
        isUserInteractionEnabled = false
    }
    
    func hideLoading() {
        setTitle(originalButtonText, for: .normal)
        activityIndicator.stopAnimating()
        isUserInteractionEnabled = true
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = activityColor
        return activityIndicator
    }
    
    private func showSpinning() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }
    
    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        addConstraint(yCenterConstraint)
    }
    
}
