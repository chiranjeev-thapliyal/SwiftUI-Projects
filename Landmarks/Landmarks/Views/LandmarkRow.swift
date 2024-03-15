//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Chiranjeev Thapliyal on 15/03/24.
//

import SwiftUI

struct LandmarkRow: View {
    let landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}

#Preview("Turtle Rock") {
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
    
}
