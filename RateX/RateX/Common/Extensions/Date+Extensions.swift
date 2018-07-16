//
//  Date+Extensions.swift
//  RateX
//
//  Created by Andre Souza on 13/07/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation


extension Date {

    func stringFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return dateFormatter.string(from: self)
    }
    
}
