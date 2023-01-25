//
//  TaskViewModel.swift
//  BuddyList
//
//  Created by Jacek Kosiński G on 25/01/2023.
//

import Foundation
import Combine

final class TaskViewModel{
    var id: UUID
    var name: String
    var date: Date
    
    init(id: UUID, name: String, date: Date) {
        self.id = id
        self.name = name
        self.date = date
    }
    
    init (task: Task){
        self.id = task.id ?? UUID()
        self.name = task.name ?? ""
        self.date = task.date ?? Date()
    }
    
    var monthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "MMM"
        return formatter
    }()
    var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "dd"
        return formatter
    }()
    
    var remainingDays: Int{
        var nextTaskComponents = Calendar.current.dateComponents([.day,.month], from: date)
        let todayComponent = Calendar.current.dateComponents([.year], from: Date())
        nextTaskComponents.year = todayComponent.year
        var nextTask = Calendar.current.date(from: nextTaskComponents)
        if Date() > nextTask! {
            nextTask = Calendar.current.date(byAdding: .year,value:1 ,to:    nextTask!)
        }
        return Calendar.current.dateComponents([.day], from: Date(), to :nextTask!).day ?? 00
        
    }
    var turningYear: Int {
        (Calendar.current.dateComponents([.year], from: date, to:Date()).year ?? 0) + 1
    }
    var monthString: String {
        monthFormatter.string(from: date)
    }
    var dayString: String {
        dayFormatter.string(from: date)
    }
    
    static let example = TaskViewModel(id: UUID(), name: "Some name", date: Date())
}
