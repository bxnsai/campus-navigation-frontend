//
//  ContentView.swift
//  csuf-navigator
//
//  Created by Fabrizio Mejia on 11/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView{
                BFS()
                    .tabItem { Text("BFS") }
                DFS()
                    .tabItem { Text("DFS") }
                Dijkstra()
                    .tabItem { Text("Dijkstra") }
            }
        }
    }
}

#Preview {
    ContentView()
}
