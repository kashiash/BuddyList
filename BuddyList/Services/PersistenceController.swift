//
//  PersistenceController.swift
//  BuddyList
//
//  Created by Jacek Kosiński G on 24/01/2023.
//

import CoreData
struct PersistenceController {
    static let shared = PersistenceController()
    let container:NSPersistentContainer
    init(){
        self.container = NSPersistentContainer(name: "FuckinGoodApp")
        container.loadPersistentStores { _, error in
            if let error = error as? NSError {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        
    }
}

extension NSManagedObjectContext{
    static var current: NSManagedObjectContext{
        return PersistenceController.shared.container.viewContext
    }
    
}
