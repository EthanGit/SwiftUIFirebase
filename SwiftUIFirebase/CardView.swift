//
//  CardView.swift
//  SwiftUIFirebase
//
//  Created by Ethan Lin on 2025/9/11.
//

import SwiftUI

struct CardView: View {
    let images = [
        "figure.stand",
        "figure.walk",
        "figure.run",
        "figure.wave",
        "figure.cooldown",
        "figure.mind.and.body",
        "figure.fall"
    ]
    
    @State private var offset: CGSize = .zero

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
        .offset(offset)
        .gesture(gesture)
        .scaleEffect(scale)
    }
}

#Preview {
    ListView()
}

// MARK: - UI
extension CardView {
    private var imageLayer: some View {
        Image(systemName: images[2])
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
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(.white, .blue)
                    .font(.title2)
                    
            }
            Text("よろしくお願いします")
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

// MARK: - Action
extension CardView {
    
    private var screenWidth: CGFloat {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return 0.0 }
        return window.screen.bounds.width
    }
    
    private var scale: CGFloat {
        max(1.0 - (abs(offset.width) / screenWidth), 0.75)
    }
    
    private var gesture: some Gesture {
        DragGesture()
            .onChanged { value in
                let width = value.translation.width
                let height = value.translation.height
                
                let limitedHeight = height > 0 ? min(height, 100) : max(height, -100)
                
                offset = CGSize(width: width, height: limitedHeight)
            }
            .onEnded { value in
                let width = value.translation.width
                let height = value.translation.height
                                
                if (abs(width) > (screenWidth/4)) {
                    withAnimation(.smooth) {
                        offset = CGSize(width: width > 0 ? screenWidth  * 1.5 : -screenWidth * 1.5, height: height)
                    }
                } else {
                    withAnimation(.smooth) {
                        offset = .zero
                    }
                }
            }
    }
}
