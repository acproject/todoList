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
    @Published var selectedTask:TodoModel?
    
    func addTask(task: String ) {
        guard task != "" else { return }
        let newTask = TodoModel(title: task)
        tasks.append(newTask)
    }
    
    func isCompletedTask(task: TodoModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    // 这里是在List容器的index的，删除的也是List传入的信息
    func deleteTask(index: IndexSet) {
        tasks.remove(atOffsets: index)
//        print("current_data: \(tasks)")
    }
    // 这里使用另外一种逻辑来实现修改数据的功能，其实原理和isCompletedTask方法一样
    func updateTask(id:UUID, title:String) {
        if let index = tasks.firstIndex(where: {$0.id == id}) {
            tasks[index].title = title
        }
    }
}
