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


/*
 notes:
 1. gmn cara input food nya? kalo pake btn yg di tabbar trus gmn balik ke page home
 2. lebi suka input pk textfield
 3. icon badge
*/
