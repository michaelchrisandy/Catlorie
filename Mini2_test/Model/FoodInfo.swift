//
//  FoodInfo.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 24/06/24.
//

import Foundation

struct FoodInfo: Codable {
    let food_id: String
    let fv_grade: String
    let g_per_serving: Double
    let display_name: String
    let nutrition: Nutrition
}
