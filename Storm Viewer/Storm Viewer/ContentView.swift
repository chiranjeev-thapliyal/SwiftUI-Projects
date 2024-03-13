//
//  ContentView.swift
//  Storm Viewer
//
//  Created by Chiranjeev Thapliyal on 09/03/24.
//

import SwiftUI

struct ContentView: View {
    private var imageNames: [String] = []
    
    init(){
        let fm = FileManager.default
        if let path = Bundle.main.resourcePath {
            do {
                let items = try fm.contentsOfDirectory(atPath: path)
                imageNames = items.filter { $0.hasPrefix("nssl") }
            } catch {
                // Handle errors here
                print("Could not load images from bundle: \(error)")
            }
        }
    }
    
    var body: some View {
        List(imageNames, id: \.self) { imageName in
            Text(imageName)
        }
    }
}

#Preview {
    ContentView()
}
