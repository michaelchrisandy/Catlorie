//
//  DailyNutrition.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 19/06/24.
//

import Foundation
import SwiftData

@Model
class DailyNutrition: Identifiable {
    var id: UUID = UUID()
    var date: Date?
    var calories: Float?
    var protein: Float?
    var carbohydrates: Float?
    var fat: Float?
    
    init(id: UUID, date: Date, calories: Float, protein: Float, carbohydrates: Float, fat: Float) {
        self.id = id
        self.date = date
        self.calories = calories
        self.protein = protein
        self.carbohydrates = carbohydrates
        self.fat = fat
    }
}
