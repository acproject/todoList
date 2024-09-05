//
//  TaskListView.swift
//  TodoList
//
//  Created by Qin Hangyu on 2024/8/29.
//

import SwiftUI

struct TaskListView: View {
    
    @EnvironmentObject var viewModel:TaskViewModel
    @State private var isEditViewPresented: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    List {
                        ForEach(viewModel.tasks) {task in
                            TaskRow(model: task) {
                                viewModel.isCompletedTask(task: task)
                            }
                            .onTapGesture {
                                viewModel.selectedTask = task
                                isEditViewPresented = true
                            }
                            
                        }
                        .onDelete(perform: viewModel.deleteTask)
                        .sheet(isPresented: $isEditViewPresented) {
                            if let tasktoEdit = viewModel.selectedTask {
                                EditTaskView(task: tasktoEdit)
                            }
                            
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("任务清单")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddTaskView()) {
                        Image(systemName: "plus")
                            .foregroundStyle(Color.toPrimary)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                }
            }
        }
        
    }
}

#Preview {
    TaskListView()
        .preferredColorScheme(.dark)
        .environmentObject(TaskViewModel())
}
