//
//  UIColor+Extension.swift
//  RateX
//
//  Created by Andre Souza on 11/06/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import UIKit
import Foundation

public extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(colorHex:Int) {
        self.init(red:(colorHex >> 16) & 0xff, green:(colorHex >> 8) & 0xff, blue:colorHex & 0xff)
    }
    
    static let mainColor  = UIColor(colorHex:0xF5B83F)
    
}
