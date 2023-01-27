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
        HStack {
            VStack {
                Text(taskVM.monthString)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 60, height: 20)
                    .background(Rectangle().fill(Color.red))
                
                Text(taskVM.dayString)
                    .bold()
                    .foregroundColor(.black)
                    .frame(height: 40)
            }
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.white))
            
            Text(taskVM.name)
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 20)
            
            Spacer()
            
            VStack(spacing: 2) {
                Text("Turning")
                    .font(.caption.bold())
                    .foregroundColor(.black)
                    .padding(5)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text("\(taskVM.turningYear)")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .shadow(radius: 4)
                
                Text("In \(taskVM.remainingDays) days")
                    .font(.caption)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
        .clipped()
    }
}

struct TaskCellView_Previews: PreviewProvider {
    static var previews: some View {
        TaskCellView(taskVM: TaskViewModel.example)
    }
}
