//
//  ListView.swift
//  SwiftUIFirebase
//
//  Created by Ethan Lin on 2025/9/11.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Cards
            cards
            // Actions
            actions
        }
        .background(.black, in: RoundedRectangle(cornerRadius: 15))
        .padding(.horizontal, 6)
    }
}

#Preview {
    ListView()
}

extension ListView {
    private var cards: some View {
        ZStack {
            ForEach(0..<5) { _ in
                CardView()
            }
        }
    }
    
    private var actions: some View {
        HStack(spacing: 68) {
            Circle()
                .frame(width: 50, height: 50)
            Circle()
                .frame(width: 50, height: 50)
            Circle()
                .frame(width: 50, height: 50)
        }
        .foregroundStyle(.white)
        .frame(height: 100)
    }
}
