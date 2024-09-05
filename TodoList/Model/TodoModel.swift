//
//  TodoModel.swift
//  TodoList
//
//  Created by Qin Hangyu on 2024/8/29.
//

import Foundation

struct TodoModel: Identifiable {
    let id = UUID()
    var title:String
    var isCompleted: Bool = false
    
    static  let placeholder = TodoModel(title: "task 1", isCompleted: false)
    
    static let placeholders:[TodoModel] = [ TodoModel(title: "task 2", isCompleted: true),
                                            TodoModel(title: "task 3", isCompleted: false),
                                            TodoModel(title: "task 4", isCompleted: false),
                                            TodoModel(title: "task 5", isCompleted: false)
                                          ]
}
