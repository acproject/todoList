//
//  TodoListApp.swift
//  TodoList
//
//  Created by Qin Hangyu on 2024/8/29.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = true
    
    // 这里我们对TaskViewModel创建了一个共享对象viewModel来处理数据，这样也简化了开发过程
    @StateObject var viewModel = TaskViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environmentObject(viewModel)
        }
    }
}
