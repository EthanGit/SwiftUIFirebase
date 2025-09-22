//
//  BasicButton.swift
//  SwiftUIFirebase
//
//  Created by Ethan Lin on 2025/9/18.
//

import SwiftUI

struct BasicButton: View {
    
    let label: String
    var icon: String? = nil
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(label)
                if let name = icon {
                    Image(systemName: name)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .foregroundColor(.white)
            .background(
                .linearGradient(colors: [.brandColorLight, .brandColorDark], startPoint: .topTrailing, endPoint: .bottomLeading)
            )
            .cornerRadius(8)
        }
    }
}

#Preview {
    BasicButton(label: "ボタン") {
        print("click")
    }
}
