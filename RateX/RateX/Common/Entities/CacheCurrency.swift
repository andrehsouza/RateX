//
//  CacheCurrency.swift
//  RateX
//
//  Created by Andre on 17/07/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import UIKit
import CoreData

@objc(CacheCurrency)
public class CacheCurrency: NSManagedObject, FetchableProtocol {
    
    @NSManaged var name: String
    @NSManaged var date: Date
    @NSManaged var rates: Set<CacheRates>

}

extension CacheCurrency {
 
    var base: Currency {
        get {
            if let currency = Currency(rawValue: name) {
                return currency
            }
            return .AUD
        }
    }
    
    var ratesSorted: [CacheRates] {
        get {
            return rates.sorted(by: { $0.name < $1.name })
        }
    }
    
}

extension CacheCurrency {
    
    convenience private init() {
        self.init(context: CoreDataStack.sharedInstance.persistentContainer.viewContext)
    }
    
    override public func awakeFromInsert() {
        date = Date()
    }
    
    static func deleteAll() {
        CoreDataStack.sharedInstance.clearDatabase(entity: identifier)
    }
    
}
