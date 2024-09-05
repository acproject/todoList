//
//  TaskListView.swift
//  TodoList
//
//  Created by Qin Hangyu on 2024/8/29.
//

import SwiftUI

struct TaskListView: View {
    
    @EnvironmentObject var viewModel:TaskViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color.toBackground1, Color.toBackground2], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack {
                    List {
                        ForEach(viewModel.tasks) { task in
                            TaskRow(model: task) {
                                
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
