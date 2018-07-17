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
        let format = NumberFormatter()
        format.numberStyle = .decimal
        format.minimumFractionDigits = 2
        format.maximumFractionDigits = 2
        format.locale = Locale(identifier: "pt_BR")
        if let doubleFormatted = format.string(from: self as NSNumber) {
            return doubleFormatted
        }
        return ""
    }
    
}
