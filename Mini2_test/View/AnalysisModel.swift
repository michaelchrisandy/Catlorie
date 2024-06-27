//
//  AnalysisModel.swift
//  BintangNewCameraTest
//
//  Created by Bintang Anandhiya on 25/06/24.
//

import Foundation

// Define the main struct for the provided JSON data
struct FoodData: Codable {
    let confidence: Double
    let quantity: Int
    let ingredients: [String]
    let food_info: FoodInfo
}

struct Item: Decodable {
    let food: [FoodData]
}

struct Analysis: Decodable {

    let analysis_id: String
    let scopes: [String]
    let items: [Item]
}
