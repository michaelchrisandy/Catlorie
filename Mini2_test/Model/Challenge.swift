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
    var id: UUID = UUID()
    var title: String
    var reward: Int
    var isCompleted: Bool = false
    var foodObj: String?
    var timeObj: Date?
    var nutritionObj: Nutrition?
    
    init(id: UUID = UUID(), title: String, reward: Int, isCompleted: Bool, foodObj: String? = nil, timeObj: Date? = nil, nutritionObj: Nutrition? = nil) {
        self.title = title
        self.reward = reward
        self.isCompleted = isCompleted
        self.foodObj = foodObj
        self.timeObj = timeObj
        self.nutritionObj = nutritionObj
    }
    
    func validate(foodInfo: FoodInfo, inputTime: Date){
        if let requiredFood = foodObj {
            if foodInfo.display_name != requiredFood {
                return
            }
        }
        
        if let requiredTime = timeObj {
            let calendar = Calendar.current
            if calendar.compare(inputTime, to: requiredTime, toGranularity: .hour) == .orderedDescending {
                return
            }
        }
        
        if let requiredNutrition = nutritionObj {
            let inputNutrition = foodInfo.nutrition
            
            //protein
            if let requiredProtein = requiredNutrition.proteins_100g {
                if inputNutrition.proteins_100g ?? 0 < requiredProtein {
                    return
                }
            }
        }
        
        self.isCompleted = true
    }
}


