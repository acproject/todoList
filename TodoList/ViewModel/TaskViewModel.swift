//
//  TaskViewModel.swift
//  TodoList
//
//  Created by Qin Hangyu on 2024/9/4.
//

import Foundation

@MainActor
final class TaskViewModel: ObservableObject {
    @Published var tasks:[TodoModel] = []
    @Published var newTask = ""
    
    func addTask(task: String ) {
        guard task != "" else { return }
        let newTask = TodoModel(title: task)
        tasks.append(newTask)
    }
}
