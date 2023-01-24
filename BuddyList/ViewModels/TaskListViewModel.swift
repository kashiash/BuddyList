//
//  TaskListViewModel.swift
//  BuddyList
//
//  Created by Jacek Kosiński G on 25/01/2023.
//

import Foundation
import Combine
import SwiftUI

final class TaskListViewModel:  ObservableObject {
    @Published var tasks = [TaskViewModel]()
    
    func fetchAllTasks() {
        tasks = DataManager.shared.getTasks().map(TaskViewModel.init)
    }
    
    func removeTask(at index: Int){
        let task = tasks[index]
        DataManager.shared.removeTask(id: task.id)
    }
}
