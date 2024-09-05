//
//  CustomButton.swift
//  TodoList
//
//  Created by Qin Hangyu on 2024/9/5.
//

import SwiftUI

struct CustomButton: View {
    
    @EnvironmentObject var viewModel:TaskViewModel
    @Environment(\.dismiss) private var dismiss
    let title:String
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
            dismiss()
            
        }label: {
            Text(title)
                .font(.headline)
                .padding()
                .foregroundStyle(Color.toDoBackground1)
                .frame(maxWidth: .infinity)
                .background(Color.toAccent)
                .cornerRadius(10)
                .offset(y: 20)
        }
    }
    
}

#Preview {
    CustomButton(title: "添加任务") {}
        .environmentObject(TaskViewModel())
        .preferredColorScheme(.dark)
}
