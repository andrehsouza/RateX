//
//  CurrencyRatesEntity.swift
//  RateX
//
//  Created by Andre on 17/07/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import UIKit
import CoreData

@objc(CacheCurrencyRates)
public class CacheCurrencyRates: NSManagedObject, FetchableProtocol {
    
    @NSManaged var name: String
    @NSManaged var date: String
    @NSManaged var value: NSNumber
    @NSManaged var rates: Set<CacheCurrencyRates>

}

// MARK: Generated accessors for rates
extension CacheCurrencyRates {
    
    @objc(addRatesObject:)
    @NSManaged public func addToRates(_ value: CacheCurrencyRates)
    
    @objc(removeRatesObject:)
    @NSManaged public func removeFromRates(_ value: CacheCurrencyRates)
    
    @objc(addRates:)
    @NSManaged public func addToRates(_ values: NSSet)
    
    @objc(removeRates:)
    @NSManaged public func removeFromRates(_ values: NSSet)
    
}

extension CacheCurrencyRates {
 
    var base: Currency {
        get {
            if let currency = Currency(rawValue: name) {
                return currency
            }
            return .AUD
        }
        set {
            self.name = newValue.rawValue
        }
    }
    
}

extension CacheCurrencyRates {
    
    convenience init() {
        self.init(context: CoreDataStack.sharedInstance.persistentContainer.viewContext)
    }
    
    convenience init(_ currencyRates: CurrencyRates) {
        self.init()
        self.name = currencyRates.base.rawValue
        self.date = currencyRates.date

        currencyRates.rates.forEach() { currency in
            let currencyRate = CacheCurrencyRates()
            currencyRate.name = currency.key.rawValue
            currencyRate.value = NSNumber(value: currency.value)
            self.addToRates(currencyRate)
        }
    }
    
}
