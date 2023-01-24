//
//  DataManager.swift
//  BuddyList
//
//  Created by Jacek Kosiński G on 24/01/2023.
//

import Foundation
import CoreData

final class DataManager {
    var managedContext: NSManagedObjectContext
    
    static let shared = DataManager(managedContext:NSManagedObjectContext.current)
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    func getTasks() -> [Task] {
        var tasks = [Task]()
        
        
        let taskRequest: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            tasks = try managedContext.fetch(taskRequest)
        } catch{
            print(error)
        }
        
        
        return tasks
    }
    
    func saveTask(id:UUID,name: String, date: Date){
        let task = Task(context: managedContext)
        task.id = id
        task.name = name
        task.date = date
        
        do {
            try managedContext.save()
        } catch {
            print(error)
        }
    }
    
    func updateTask(id:UUID, name: String, date: Date){
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@",id.uuidString)
        do {
            let task = try managedContext.fetch(fetchRequest).first
            task?.name = name
            task?.date = date

            try managedContext.save()

        } catch {
            print(error)
        }
    }
    
    func removeTask(id:UUID){
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@",id.uuidString)
        do {
            let tasks = try managedContext.fetch(fetchRequest)
            for task in tasks {
                managedContext.delete(task)
            }
            try managedContext.save()
        } catch {
            print(error)
        }
    }
}
