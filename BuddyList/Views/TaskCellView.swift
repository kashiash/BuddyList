//
//  TaskCellView.swift
//  BuddyList
//
//  Created by Jacek Kosiński on 25/01/2023.
//

import SwiftUI

struct TaskCellView: View {
    var taskVM: TaskViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TaskCellView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCellView(taskVM: TaskViewModel.example)
    }
}
