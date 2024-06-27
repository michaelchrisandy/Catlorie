//
//  Challenge.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 24/06/24.
//

import Foundation
import SwiftData

@Model
class Challenge: Identifiable {
    var id = UUID()
    var title: String
    var reward: Int
    var isCompleted = false
    var hasBeenShown = false
    var foodObj: String?
    var timeObj: Date?
    var nutritionObj: Nutrition?
    
    init(title: String, reward: Int, foodObj: String? = nil, timeObj: Date? = nil, nutritionObj: Nutrition? = nil) {
        self.title = title
        self.reward = reward
        self.foodObj = foodObj
        self.timeObj = timeObj
        self.nutritionObj = nutritionObj
    }
    
    func validate(foodInfo: FoodInfo) {
        // food objective
        if let requiredFood = foodObj {
            if !foodInfo.display_name.lowercased().contains(requiredFood.lowercased()) {
                return
            }
        }
        
        // time objective
//        if let requiredTime = timeObj {
//            let calendar = Calendar.current
//            print("Validating time: \(inputTime) < \(requiredTime)")
//            // Check if the inputTime is earlier than the requiredTime
//            if calendar.compare(inputTime, to: requiredTime, toGranularity: .minute) != .orderedAscending {
//                print("Time validation failed")
//                return
//            }
//        }
        
        // nutrition objective
        if let requiredNutrition = nutritionObj {
            let inputNutrition = foodInfo.nutrition
            
            // protein
            if let requiredProtein = requiredNutrition.proteins_100g {
                if inputNutrition.proteins_100g ?? 0 < requiredProtein {
                    return
                }
            }
        }
        
        self.isCompleted = true
    }
}


extension Date {
    func withLocalTime(hour: Int, minute: Int) -> Date? {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current
        
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: self)
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.timeZone = TimeZone.current
        
        return calendar.date(from: dateComponents)
        
    }
}
