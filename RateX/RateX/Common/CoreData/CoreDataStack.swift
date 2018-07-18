//
//  CoreDataStack.swift
//  RateX
//
//  Created by Andre on 17/07/2018.
//  Copyright © 2018 Andre. All rights reserved.
//

import Foundation
import CoreData

//MARK: - Core Data stack
class CoreDataStack: NSObject {
    
    static let sharedInstance = CoreDataStack()
    static let containerName = "RateX"
    
    private override init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: CoreDataStack.containerName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
}

// MARK: - Core Data Saving support

extension CoreDataStack {
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func clearDatabase(entity: String) {
        let context = persistentContainer.viewContext
        let coord = context.persistentStoreCoordinator
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity )
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try coord?.execute(deleteRequest, with: context)
        } catch let error as NSError {
            debugPrint(error)
        }
    }
}
