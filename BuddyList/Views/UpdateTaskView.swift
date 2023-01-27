//
//  UpdateTaskView.swift
//  BuddyList
//
//  Created by Jacek Kosiński G on 25/01/2023.
//

import SwiftUI

final class UpdateTaskData: ObservableObject {
    @Published var id = UUID()
    @Published var name: String = ""
    @Published var date = Date()
}


struct UpdateTaskView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var data = UpdateTaskData()
    
    private var viewModel = UpdateTaskViewModel()
    
    init(taskVM: TaskViewModel) {
        data.id = taskVM.id
        data.name = taskVM.name
        data.date = taskVM.date
    }
    

    var body: some View {
        VStack {
            HStack {
                Text("Update Task")
                    .font(.title)
                Spacer()
            }
            .padding(.bottom, 10)
            
            TextField("name", text: $data.name)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom, 10)
            
            HStack {
                Text("Date ")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    
                
                DatePicker("", selection: $data.date, in: ...Date(), displayedComponents: [.date,.hourAndMinute])
                    .labelsHidden()
            }
            .background(Color.red.opacity(0.7), in: RoundedRectangle(cornerRadius: 10))
            
            HStack {
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
                .background(Color.red.opacity(0.3))
                
                Button("Save") { update() }
            }
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            
            Spacer()
        }
        .padding()
        .background(LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    private func update() {
        let task = TaskViewModel(id: data.id, name: data.name, date: data.date)
        viewModel.updateTask(task: task)
        dismiss()
    }
}

struct UpdateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateTaskView(taskVM: TaskViewModel.example)
    }
}
