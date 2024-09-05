//
//  BackgroundView.swift
//  TodoList
//
//  Created by Qin Hangyu on 2024/9/5.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors: [Color.toBackground1, Color.toBackground2], startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
