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
    var id = UUID()
    var name: String?
    var targetCalories: Float?
    var targetCarbohydrates: Float?
    var targetProtein: Float?
    var targetFat: Float?
    var dailyNutrition: [DailyNutrition]? = []
    var cat: Cat?
    
    init(id: UUID = UUID(), name: String, targetCalories: Float, targetCarbohydrates: Float, targetProtein: Float, targetFat: Float) {
        self.name = name
        self.targetCalories = targetCalories
        self.targetCarbohydrates = targetCarbohydrates
        self.targetProtein = targetProtein
        self.targetFat = targetFat
//        self.dailyNutrition = dailyNutrition
//        self.cat = cat
    }
    
    static func dummyData() -> User {
        return User(name: "Aaron",
                    targetCalories: 2000,
                    targetCarbohydrates: 225,
                    targetProtein: 65,
                    targetFat: 45
//                    dailyNutrition: DailyNutrition.dummyData(),
//                    cat: Cat.dummyData()
        )
    }
}
