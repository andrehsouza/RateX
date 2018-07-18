//
//  CacheRates.swift
//  RateX
//
//  Created by Andre Souza on 18/07/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import UIKit
import CoreData

@objc(CacheRates)
class CacheRates: NSManagedObject, FetchableProtocol {
    
    @NSManaged var name: String
    @NSManaged var value: Double

}

extension CacheRates {
    
    var base: Currency {
        get {
            if let currency = Currency(rawValue: name) {
                return currency
            }
            return .AUD
        }
    }
    
}

extension CacheRates {
    
    convenience private init() {
        self.init(context: CoreDataStack.sharedInstance.persistentContainer.viewContext)
    }
    
    static func deleteAll() {
        CoreDataStack.sharedInstance.clearDatabase(entity: identifier)
    }
    
}

