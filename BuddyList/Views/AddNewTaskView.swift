//
//  AddNewTaskView.swift
//  BuddyList
//
//  Created by Jacek Kosiński G on 25/01/2023.
//

import SwiftUI
final class NewTaskData: ObservableObject {
    @Published var name: String = ""
    @Published var date = Date()
}

struct AddNewTaskView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var newData = NewTaskData()
    
    private let model = AddNewTaskViewModel()
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Add New Task")
                    .font(.title)
                
                Spacer()
            }
            .padding(.bottom, 10)
            
            TextField("Enter name", text: $newData.name)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom, 10)
            
            HStack {
                Text("Date")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 40)
                
                DatePicker("", selection: $newData.date, in: ...Date(), displayedComponents: [.date,.hourAndMinute])
                    .labelsHidden()
            }
            .background(Color.red.opacity(0.7), in: RoundedRectangle(cornerRadius: 10))
            
            HStack {
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
                .background(Color.red.opacity(0.3))
                
                Button("Save") {
                    addNew()
                }
            }
            .buttonStyle(.bordered)
            .foregroundColor(.white)
        }
        .padding()
        .background(Color.black, in: RoundedRectangle(cornerRadius: 20))
        .padding()
    }
    
    
    
    
    private func addNew() {
        let task = TaskViewModel(id: UUID(), name: newData.name, date: newData.date)
        model.saveTask(task: task)
        dismiss()
    }
}

struct AddNewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTaskView()
    }
}
