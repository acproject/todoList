//
//  AddTaskView.swift
//  TodoList
//
//  Created by Qin Hangyu on 2024/8/29.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel:TaskViewModel
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                    CustomTextField(placeholder: "输入你的任务")
                    CustomButton(title: "添加任务") {
                        viewModel.addTask(task: viewModel.newTask)
                    }.disabled(viewModel.newTask.isEmpty && viewModel.newTask == "")

                Spacer()
                
            }
            .padding()
        }
        .navigationTitle("添加新任务")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true) // 这里将会清楚返回的按钮，后续使用toolbar做一个自己的
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                        .font(.headline)
                        .foregroundStyle(.toDoAccent)
                }
            }
        }
        .onAppear{
            viewModel.newTask = ""
        }
    }
    

}

#Preview {
    NavigationStack {
        AddTaskView()
            .preferredColorScheme(.dark)
            .environmentObject(TaskViewModel())
    }
}
