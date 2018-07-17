//
//  RCardView.swift
//  RateX
//
//  Created by Andre Souza on 09/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import UIKit

@IBDesignable
class RCardView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            updateViewsFromIB()
        }
    }
    
    @IBInspectable var radiusOnlyBottom: Bool = false {
        didSet {
            updateViewsFromIB()
        }
    }
    
    @IBInspectable var shadowColor: UIColor? = UIColor.black {
        didSet {
            updateViewsFromIB()
        }
    }
    
    @IBInspectable var layerBackgroundColor: UIColor? = UIColor.clear {
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
    
    @IBInspectable var borderColor: UIColor? = UIColor.white {
        didSet {
            updateViewsFromIB()
        }
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateViewsFromIB()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupView()
    }
}

extension RCardView: BaseViewProtocol {
    
    func setupView() {
        layer.cornerRadius = cornerRadius
        if radiusOnlyBottom {
           layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
//        layer.masksToBounds = true
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
        layer.backgroundColor = layerBackgroundColor?.cgColor
        //Shadow
        let shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = cornerRadius
        layer.shadowPath = shadowPath
        layer.shouldRasterize = true
    }
    
}
