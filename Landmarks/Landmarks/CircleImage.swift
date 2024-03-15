//
//  CircleImage.swift
//  Landmarks
//
//  Created by Chiranjeev Thapliyal on 15/03/24.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image(_: "turtlerock")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }.shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}
