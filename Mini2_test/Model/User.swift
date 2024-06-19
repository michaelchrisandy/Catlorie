//
//  User.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 19/06/24.
//

import SwiftData
import Foundation

@Model
class User: Identifiable {
    var id: UUID = UUID()
    var name: String
    var targetCalories: Float
    var targetCarbohydrates: Float
    var targetProtein: Float
    var targetFat: Float
    var dailyNutrition: [DailyNutrition] = []
    var badges: [Badge] = []
    var cat: Cat
    
    init(id: UUID, name: String, targetCalories: Float, targetCarbohydrates: Float, targetProtein: Float, targetFat: Float, dailyNutrition: [DailyNutrition], badges: [Badge], cat: Cat) {
        self.id = id
        self.name = name
        self.targetCalories = targetCalories
        self.targetCarbohydrates = targetCarbohydrates
        self.targetProtein = targetProtein
        self.targetFat = targetFat
        self.dailyNutrition = dailyNutrition
        self.badges = badges
        self.cat = cat
    }
}
