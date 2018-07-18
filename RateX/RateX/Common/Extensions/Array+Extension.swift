//
//  Array+Extension.swift
//  RateX
//
//  Created by Andre Souza on 17/07/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import Foundation

extension Array {
    
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}

extension Array where Element: CacheCurrency {
    
    func filter(with currency: Currency) -> CacheCurrency? {
        return filter({ $0.base == currency }).first
    }
    
}

extension Array where Element: CacheRates {
    
    func filter(with currency: Currency) -> CacheRates? {
        return filter({ $0.base == currency }).first
    }
    
}
