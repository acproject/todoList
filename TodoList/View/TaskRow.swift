//
//  TaskRow.swift
//  TodoList
//
//  Created by Qin Hangyu on 2024/9/5.
//

import SwiftUI

struct TaskRow: View {
    
    @State var model:TodoModel
    
    let action: () -> ()
    
    var body: some View {
        HStack {
            if model.isCompleted {
                finishedTaskView(model)
            }
            else { 
                notFinishedTaskView(model)
            }
            Spacer()
            Button {
                model.isCompleted.toggle()
            }label: {
                Image(systemName: model.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(.toDoAccent)
                   
            }
        }
        .font(.headline)
        .padding()
        .background(model.isCompleted ? .toDoPrimary.opacity(0.1) : .toDoPrimary.opacity(0.25))
        .cornerRadius(10)
        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
        .padding(.vertical, 6)
        
    }
    
}

@ViewBuilder
private func finishedTaskView(_ model:TodoModel) -> some View {
     Text(model.title).strikethrough().foregroundStyle(Color.toPrimary.opacity(0.5))
}
@ViewBuilder
private func notFinishedTaskView(_ model: TodoModel) -> some View {
    Text(model.title)
        .font(.headline)
}

#Preview {
    List {
        TaskRow(model: .placeholder) {}
        TaskRow(model: TodoModel(title: "task11", isCompleted: true)) {}
    }
    .listStyle(.plain)
    .preferredColorScheme(.dark)
}
