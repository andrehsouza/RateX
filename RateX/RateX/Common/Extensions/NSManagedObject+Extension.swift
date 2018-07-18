//
//  NSManagedObject+Extension.swift
//  RateX
//
//  Created by Andre on 09/06/2018.
//  Copyright © 2018 AndreSamples. All rights reserved.
//

import Foundation
import CoreData

protocol FetchableProtocol: class {
    associatedtype FetchableType: NSManagedObject = Self
}

extension FetchableProtocol where Self : NSManagedObject, FetchableType == Self {
    
    static func fetchAll() -> [FetchableType] {
        let fetchRequest = NSFetchRequest<FetchableType>(entityName: identifier)
        do {
            let array = try CoreDataStack.sharedInstance.persistentContainer.viewContext.fetch(fetchRequest) as [FetchableType]
            return array
        } catch let errore {
            print("error FetchRequest \(errore)")
        }

        return []
    }
}

