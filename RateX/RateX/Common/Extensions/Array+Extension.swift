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
