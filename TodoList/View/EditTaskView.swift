//
//  EditTaskView.swift
//  TodoList
//
//  Created by Qin Hangyu on 2024/9/5.
//

import SwiftUI

struct EditTaskView: View {
    @EnvironmentObject var viewModel:TaskViewModel
    @Environment(\.dismiss) private var dismiss
//    @State var isEnabled = false
    var task: TodoModel
    
    var body: some View {
        VStack {
            // MRAK: Header
            HStack(alignment:.center) {
                
                Text("编辑任务")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .topLeading) {
                        Button {
                            dismiss()
                        }label: {
                            Text("取消")
                                .frame(width: 56)
                                .foregroundStyle(.toDoAccent)
                        }.frame(alignment: .trailing)
                    }
                    .padding(.vertical)
                
            }
            // MARK Body
            
            CustomTextField(placeholder: "编辑")
            CustomButton(title: "保存") {
                viewModel.updateTask(id: task.id, title:viewModel.newTask )
               dismiss()
            }.disabled(viewModel.newTask.isEmpty && viewModel.newTask == "")
            Spacer()
        }
        .padding()
        .background(
           BackgroundView()
        )
    }
}

#Preview {
    EditTaskView(task: .placeholder)
        .environmentObject(TaskViewModel())
        .preferredColorScheme(.dark)
}
