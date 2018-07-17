//
//  Double+Extension.swift
//  RateX
//
//  Created by Andre Souza on 17/07/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import Foundation

extension Double {
    
    func decimalFormat() -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = ""
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.minimumFractionDigits = 2
        currencyFormatter.locale = Locale(identifier: "pt_BR")
        if let doubleFormatted = currencyFormatter.string(from: self as NSNumber) {
            return doubleFormatted
        }
        return "0,00"
    }
    
}
