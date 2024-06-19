//
//  ContentView.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 13/06/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @State var user: User
    
    var body: some View {
        
        VStack {
            TabView {
                HomeView(user: User.dummyData())
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
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: User.self, Cat.self, DailyNutrition.self, Badge.self, configurations: config)
    
    let user = User.dummyData()
    return ContentView(user: user)
        .modelContainer(container)
}



