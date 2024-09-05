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
            LinearGradient(colors: [Color.toBackground1, Color.toBackground2], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                TextField("输入你的任务", text: $viewModel.newTask)
                    .padding()                                      // 注意padding与background的位置，效果是不同的
                    .background(Color.toDoPrimary.opacity(0.15))
                    .cornerRadius(10)
                    .offset(y: 20)
                
                
                
                Button {
                    viewModel.addTask(task: viewModel.newTask)
                    dissmissClean()
                    
                }label: {
                    Text("添加任务")
                        .font(.headline)
                        .padding()
                        .foregroundStyle(Color.toDoBackground1)
                        .frame(maxWidth: .infinity)
                        .background(Color.toAccent)
                        .cornerRadius(10)
                        .offset(y: 20)
                }

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
    
    private func dissmissClean() {
        viewModel.newTask = ""
        dismiss()
    }
    
}

#Preview {
    NavigationStack {
        AddTaskView()
            .preferredColorScheme(.dark)
            .environmentObject(TaskViewModel())
    }
}
