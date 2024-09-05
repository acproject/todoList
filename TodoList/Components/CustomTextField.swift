//
//  CustomTextField.swift
//  TodoList
//
//  Created by Qin Hangyu on 2024/9/5.
//

import SwiftUI

struct CustomTextField: View {
    @EnvironmentObject var viewModel:TaskViewModel
    let placeholder:String
    
    var body: some View {
        TextField(self.placeholder, text: $viewModel.newTask)
            .padding()                                      // 注意padding与background的位置，效果是不同的
            .background(Color.toDoPrimary.opacity(0.15))
            .cornerRadius(10)
            .offset(y: 20)
    }
}

#Preview {
    CustomTextField(placeholder: "输入你的任务")
        .environmentObject(TaskViewModel())
        .preferredColorScheme(.dark)
}
