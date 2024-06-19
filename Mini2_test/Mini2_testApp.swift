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
            ContentView(user: User.dummyData())
        }
        .modelContainer(for:
            User.self
        )
    }
}
