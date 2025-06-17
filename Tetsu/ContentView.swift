//
//  ContentView.swift
//  Tetsu
//
//  Created by Jeremiah Soe on 6/16/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            TabView{
                HomeView()
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                HistoryView()
                    .tabItem{
                        Label("History", systemImage: "clock")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
