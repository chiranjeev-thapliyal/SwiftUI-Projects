//
//  ContentView.swift
//  Landmarks
//
//  Created by Chiranjeev Thapliyal on 15/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = Tab.featured
    
    enum Tab {
      case featured
      case list
    }
    
    var body: some View {
        TabView(selection: $selection){
            CategoryHome().tag(Tab.featured).tabItem {  Label("Featured", systemImage: "star") }
            LandmarkList().tag(Tab.list).tabItem {  Label("List", systemImage: "list.bullet") }
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
