//
//  Mini2_testApp.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 13/06/24.
//

import SwiftUI

@main
struct Mini2_testApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for:
            [
                User.self,
                Cat.self,
                DailyNutrition.self,
                Badge.self
            ]
        )
    }
}
