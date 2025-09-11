//
//  CardView.swift
//  SwiftUIFirebase
//
//  Created by Ethan Lin on 2025/9/11.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background
            Color.black
            // image
            imageLayer
            // Gradient
            LinearGradient(colors: [.clear, .black], startPoint: .center, endPoint: .bottom)
            // Information
            informationLayer
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))

    }
}

#Preview {
    CardView()
}

extension CardView {
    private var imageLayer: some View {
        Image(systemName: "person.crop.rectangle.fill")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .background(Color(red: 0.9, green: 0.9, blue: 0.9))
            .frame(width: 100)
    }
    
    private var informationLayer: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Text("イーサン")
                    .font(.largeTitle.bold())
                Text("99")
                    .font(.title2)
                Circle()
                    .frame(width: 22, height: 22)
            }
            Text("よろしくお願いします")
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}
