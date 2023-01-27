//
//  UpdateTaskViewModel.swift
//  BuddyList
//
//  Created by Jacek Kosiński G on 25/01/2023.
//

import Foundation


final class UpdateTaskViewModel{
    func updateTask(task: TaskViewModel){
        DataManager.shared.updateTask(id: task.id, name: task.name, date: task.date)
    }
}
