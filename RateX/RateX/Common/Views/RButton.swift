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

    @IBInspectable var fillColor: UIColor? = UIColor.white {
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
        layer.shadowOffset = CGSize(width: -1, height: 1)
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
