//
//  ContentView.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 13/06/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("", systemImage: "house.fill")
                    }
                NutritionTargetView()
                    .tabItem {
                        Label("", systemImage: "pencil.and.scribble")
                    }
                NutritionTargetTextView()
                    .tabItem {
                        Label("", systemImage: "pencil.and.scribble")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}



