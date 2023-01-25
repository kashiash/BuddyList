//
//  TaskListView.swift
//  BuddyList
//
//  Created by Jacek Kosiński G on 25/01/2023.
//

import SwiftUI

struct TaskListView: View {
    @StateObject var taskVM = TaskListViewModel()
    @State private var  addNewPresented = false
    
    var header: some View {
        VStack{
            Text("Task")
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 60)
                .background(Rectangle().fill(Color.clear))
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack(alignment: .bottomTrailing) {
                    header
                        .padding(.top,10)
                    Button(action: {addNewPresented.toggle()}){
                        Image(systemName: "plus.circle")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .padding([.trailing,.bottom],20)
                    fullScreenCover(isPresented: $addNewPresented){
                        AddNewTaskView().onDisappear{
                            // refresh all data
                            refreshData()
                        }
                       .background(BackgroundClearView())
                    }
                }
                
                List{
                    ForEach(taskVM.tasks.indices, id: \.self) { idx in
                        ZStack{
                            TaskCellView(taskVM: taskVM.tasks[idx])
                                .shadow(radius: 10)
                            NavigationLink(destination: UpdateTaskView(taskVM: taskVM.tasks[idx])
                                .onDisappear{refreshData()}
                            ){
                                EmptyView()
                            }
                            .opacity(0.0)
                        }
                    }
                    .onDelete(perform: deleteTask(at: ))
                    .listRowBackground(Color.clear)
                    .listStyle(.plain)
                }
                .navigationTitle("")
                .navigationBarHidden(true)
            }
            .onAppear{
                refreshData()
            }
            .background{
                LinearGradient(colors: [.purple,.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                   
            }
            .scrollContentBackground(.hidden)
            .navigationBarTitleDisplayMode(.inline)
        }
        .edgesIgnoringSafeArea(.all)
        .preferredColorScheme(.dark)
    }
    
    func refreshData(){
        taskVM.fetchAllTasks()
    }
    func deleteTask(at offsets: IndexSet){
        for index in offsets{
            taskVM.removeTask(at: index)
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
