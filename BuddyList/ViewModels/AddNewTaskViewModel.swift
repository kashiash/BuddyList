//
//  AddNewTaskViewModel.swift
//  BuddyList
//
//  Created by Jacek Kosiński G on 25/01/2023.
//

import Foundation


final class AddNewTaskViewModel {
    func saveTask(task: TaskViewModel) {
        DataManager.shared.saveTask(id: task.id, name: task.name, date: task.date)
    }
}
