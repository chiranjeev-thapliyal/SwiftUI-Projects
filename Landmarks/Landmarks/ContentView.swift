//
//  ContentView.swift
//  Landmarks
//
//  Created by Chiranjeev Thapliyal on 15/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
