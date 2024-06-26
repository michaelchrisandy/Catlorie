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
    @Query var user: [User]
    var body: some View {
        if(user.isEmpty){
            OnboardingView()
        }else{
            VStack {
                TabView {
                    HomeView()
                        .tabItem {
                            Label("", systemImage: "house.fill")
                        }
                    BadgesView()
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
}

#Preview {
    ContentView()
        .preferredColorScheme(.light)
}



