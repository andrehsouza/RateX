//
//  String+Extension.swift
//  RateX
//
//  Created by Andre Souza on 17/07/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import Foundation

extension String {
    
    func toDouble() -> Double? {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = ""
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.minimumFractionDigits = 2
        currencyFormatter.locale = Locale(identifier: "pt_BR")
        
        if let doubleFormatted = currencyFormatter.number(from: self)?.doubleValue {
            return doubleFormatted
        } else {
            return 0.00
        }
        
    }
    
    func onlydigits() -> String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    func currencyInputFormatting() -> String {
        let double = onlydigits().toDouble() ?? 0.00
        let number = NSNumber(value: (double / 100))
        return number.doubleValue.decimalFormat()
    }
    
}
