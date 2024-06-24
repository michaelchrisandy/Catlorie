//
//  Challenge.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 24/06/24.
//

import Foundation
import SwiftData

struct Challenge {
    var title: String
    var reward: Int
    var isCompleted: Bool = false
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
    
    static func createChallenges() -> [Challenge] {
        return [
            Challenge(title: "Drink Milk", reward: 10, foodObj: "milk")
        ]
    }
}

