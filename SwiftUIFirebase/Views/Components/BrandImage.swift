//
//  BrandImage.swift
//  SwiftUIFirebase
//
//  Created by Ethan Lin on 2025/9/18.
//

import SwiftUI

struct BrandImage: View {
    var body: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .scaledToFill()
            .foregroundStyle(.red)
            .frame(width: 120, height: 120)
            .padding(.vertical, 32)
    }
}

#Preview {
    BrandImage()
}
