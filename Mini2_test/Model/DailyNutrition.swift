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
    var calories: Float?
    var protein: Float?
    var date: Date
    var calories: Float
    var protein: Float
    
    init(date: Date, calories: Float, protein: Float, carbohydrates: Float, fat: Float) {
        self.date = date
        self.calories = calories
        self.protein = protein
        self.carbohydrates = carbohydrates
        self.fat = fat
    }
    
    static func dummyData() -> [DailyNutrition] {
        return [
            DailyNutrition(date: Date(), 
                           calories: 1800,
                           protein: 60,
                           carbohydrates: 200,
                           fat: 50),
            DailyNutrition(date: 
                            Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
                           calories: 2200,
                           protein: 80,
                           carbohydrates: 250,
                           fat: 70),
            DailyNutrition(date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, 
                           calories: 1500,
                           protein: 55,
                           carbohydrates: 150,
                           fat: 45)
        ]
    }
}
