//
//  UIView+Extension.swift
//  RateX
//
//  Created by Andre on 11/06/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import UIKit

extension UIView {
    
    public func bindFrameToSuperviewBounds() {
        guard let superview = self.superview else {
            print("Error! 'superview' was nil – call 'addSubview(view: UIView)' before calling 'bindFrameToSuperviewBounds() to fix this.")
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    }
    
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(identifier, owner: nil, options: nil)![0] as! T
    }
    
}
