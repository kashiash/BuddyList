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
                       // .background(BackGroundClearView())
                    }
                }
                
                List{
                    
                }
            }
        }
    }
    
    func refreshData(){
        taskVM.fetchAllTasks()
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
