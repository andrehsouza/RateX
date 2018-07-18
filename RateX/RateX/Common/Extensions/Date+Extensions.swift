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

    func isOutOfDate() -> Bool {
        let calendar = NSCalendar.current
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: Date())
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        return (components.day ?? 0) > 0
    }
    
}
