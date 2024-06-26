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
    var streak: Int = 0
    var coin: Int = 0
    @Relationship(deleteRule: .cascade) var dailyNutrition = [DailyNutrition]()
    @Relationship(deleteRule: .cascade) var cat: Cat
    
    init(id: UUID = UUID(), name: String, targetCalories: Float, targetCarbohydrates: Float, targetProtein: Float, targetFat: Float) {
        self.name = name
        self.targetCalories = targetCalories
        self.targetCarbohydrates = targetCarbohydrates
        self.targetProtein = targetProtein
        self.targetFat = targetFat
        self.cat = Cat(catWeightCategory: .ideal, catExpressionCategory: .happy)
        
//        self.cat = Cat(catWeightCategory: getCatWeightCategory(), catExpressionCategory: .happy)
    }
    
    func getCatWeightCategory() -> CatWeightCategory{
        //ambil index terakhir (untuk hari ini)
        let idx = dailyNutrition.count - 1
//        print(idx)
        
        if(idx < 0){
            return .skinny
        }
        //set epsilon 20% dari target
        let eps = targetCalories! * 20 / 100
        
        let todayNutrition = dailyNutrition[idx]
        
//        print("xx")
//        print(todayNutrition.calories)
        
        if(todayNutrition.calories > targetCalories! + eps){
            return .overweight
        }
        else if(todayNutrition.calories < targetCalories! - eps){
            return .skinny
        }
        else{
            return .ideal
        }
    }
    
    func getCatExpressionCategory() -> CatExpressionCategory{
        //ambil index terakhir (untuk hari ini)
        let idx = dailyNutrition.count - 1
        
        if(idx < 0){
            return .sad
        }
        
        let todayNutrition = dailyNutrition[idx]
        
        //1 protein
        //2 carbohydrates
        //3 fat
        var passed : Int = 0
        for i in 1...3{
            var eps : Float = 0.0
            var target : Float = 0.0
            var nutrition : Float = 0.0
            if(i == 1){
                eps = todayNutrition.protein * 20 / 100
                target = targetProtein!
                nutrition = todayNutrition.protein
            }
            else if(i==2){
                eps = todayNutrition.carbohydrates * 20 / 100
                target = targetCarbohydrates!
                nutrition = todayNutrition.carbohydrates
            }
            else{
                eps = todayNutrition.fat * 20 / 100
                target = targetFat!
                nutrition = todayNutrition.fat
            }
            
            if(nutrition >= target - eps && nutrition <= target + eps){
                passed += 1
            }
        }
        
        if(passed == 3){
            return .happy
        }
        else if(passed == 2){
            return .smile
        }
        else{
            return .sad
        }
    }
    
}


