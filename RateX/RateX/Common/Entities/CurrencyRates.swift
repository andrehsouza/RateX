//
//  CurrencyRates.swift
//  RateX
//
//  Created by Andre Souza on 16/07/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import Foundation

struct CurrencyRates: Decodable {
    
    var base: Currency
    var date: String
    var rates: [Currency: Float] = [:]
    
    enum CodingKeys: String, CodingKey {
        case base, date, rates
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.base = try container.decode(Currency.self, forKey: .base)
        self.date = try container.decode(String.self, forKey: .date)
        let arrayrates = try container.decode([String:Float].self, forKey: .rates)
        arrayrates.forEach() {
            if let currency = Currency(rawValue: $0.key) {
                rates[currency] = $0.value
            }
        }
    }

}
