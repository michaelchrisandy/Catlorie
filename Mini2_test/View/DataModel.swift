/*
See the License.txt file for this sample’s licensing information.
*/

import AVFoundation
import SwiftUI
import os.log

extension PresentationDetent {
    static let small = Self.height(90)
    static let open = Self.height(510)
}

final class DataModel: ObservableObject {
    let camera = Camera()
    
    @Published var viewfinderImage: Image?
    @Published var thumbnailImage: Image?
    
    @Published var fat: CGFloat = 0
    @Published var carbo: CGFloat = 0
    @Published var protein: CGFloat = 0
    
    @Published var textInput1: String = ""
    @Published var textInput2: String = ""
    @Published var textInput3: String = ""
    
    @Published var calories: CGFloat = 0
    @Published var analysis: Analysis?
    
    @Published var isWaitingForAPI: Bool = false
    
    @Published var selectedDetent: PresentationDetent = .small
    
    init() {
        Task {
            await handleCameraPreviews()
        }
        
        Task {
            await handleCameraPhotos()
        }
    }
    
    func updateCalories(){
        calories = fat*9 + carbo*4 + protein*4
    }

    func getDummyJSON() -> String {
        return """
                    {
                      "analysis_id": "0afb2767-d228-44d4-9393-a033ff5f837d",
                      "scopes": [
                        "quantity",
                        "position",
                        "multiple_items",
                        "nutrition:micro",
                        "nutrition:nutriscore",
                        "nutrition:macro"
                      ],
                      "items": [
                        {
                          "position": {
                            "x": 0.3546,
                            "y": 0.3375,
                            "width": 0.3074,
                            "height": 0.2885
                          },
                          "food": [
                            {
                              "confidence": 0.9276,
                              "quantity": 125,
                              "ingredients": [],
                              "food_info": {
                                "food_id": "6febd44d55628346b4a6c55fe96d5af0",
                                "fv_grade": "D",
                                "g_per_serving": 125,
                                "display_name": "Soda",
                                "nutrition": {
                                  "alcohol_100g": 0,
                                  "calcium_100g": 0.00346,
                                  "calories_100g": 41,
                                  "carbs_100g": 9.9,
                                  "chloride_100g": null,
                                  "cholesterol_100g": 0,
                                  "copper_100g": null,
                                  "fat_100g": 10.9,
                                  "fibers_100g": 0,
                                  "glycemic_index": 60,
                                  "insat_fat_100g": 0,
                                  "iodine_100g": null,
                                  "iron_100g": 0.0000367,
                                  "magnesium_100g": 0.00244,
                                  "manganese_100g": null,
                                  "mono_fat_100g": 0,
                                  "omega_3_100g": 0,
                                  "omega_6_100g": 0,
                                  "phosphorus_100g": 0.0137,
                                  "poly_fat_100g": 0,
                                  "polyols_100g": null,
                                  "potassium_100g": 0.0015,
                                  "proteins_100g": 0,
                                  "salt_100g": null,
                                  "sat_fat_100g": 0,
                                  "selenium_100g": null,
                                  "sodium_100g": 0.00542,
                                  "sugars_100g": 9.95,
                                  "veg_percent": 0,
                                  "vitamin_a_beta_k_100g": null,
                                  "vitamin_a_retinol_100g": null,
                                  "vitamin_b12_100g": null,
                                  "vitamin_b1_100g": null,
                                  "vitamin_b2_100g": null,
                                  "vitamin_b3_100g": null,
                                  "vitamin_b5_100g": null,
                                  "vitamin_b6_100g": null,
                                  "vitamin_b9_100g": 0,
                                  "vitamin_c_100g": 0,
                                  "vitamin_d_100g": null,
                                  "vitamin_e_100g": null,
                                  "vitamin_k1_100g": null,
                                  "water_100g": null,
                                  "zinc_100g": null
                                }
                              }
                            },
                            {
                              "confidence": 0,
                              "quantity": 178,
                              "ingredients": [],
                              "food_info": {
                                "food_id": "87aacb055e7b23a5a8ba13281d34809e",
                                "fv_grade": "A",
                                "g_per_serving": 178,
                                "display_name": "Tea",
                                "nutrition": {
                                  "alcohol_100g": 0,
                                  "calcium_100g": 0.104,
                                  "calories_100g": 0,
                                  "carbs_100g": 0,
                                  "chloride_100g": null,
                                  "cholesterol_100g": 0,
                                  "copper_100g": null,
                                  "fat_100g": 0,
                                  "fibers_100g": 0,
                                  "glycemic_index": 0,
                                  "insat_fat_100g": 0,
                                  "iodine_100g": null,
                                  "iron_100g": 0.0000444,
                                  "magnesium_100g": 0.00265,
                                  "manganese_100g": null,
                                  "mono_fat_100g": 0,
                                  "omega_3_100g": 0,
                                  "omega_6_100g": 0,
                                  "phosphorus_100g": 0.00175,
                                  "poly_fat_100g": 0,
                                  "polyols_100g": null,
                                  "potassium_100g": 0.0101,
                                  "proteins_100g": 0.075,
                                  "salt_100g": null,
                                  "sat_fat_100g": 0,
                                  "selenium_100g": null,
                                  "sodium_100g": 0.00252,
                                  "sugars_100g": 0,
                                  "veg_percent": 0,
                                  "vitamin_a_beta_k_100g": null,
                                  "vitamin_a_retinol_100g": null,
                                  "vitamin_b12_100g": null,
                                  "vitamin_b1_100g": null,
                                  "vitamin_b2_100g": null,
                                  "vitamin_b3_100g": null,
                                  "vitamin_b5_100g": null,
                                  "vitamin_b6_100g": null,
                                  "vitamin_b9_100g": 1e-7,
                                  "vitamin_c_100g": 0,
                                  "vitamin_d_100g": null,
                                  "vitamin_e_100g": null,
                                  "vitamin_k1_100g": null,
                                  "water_100g": null,
                                  "zinc_100g": null
                                }
                              }
                            },
                            {
                              "confidence": 0,
                              "quantity": 180,
                              "ingredients": [],
                              "food_info": {
                                "food_id": "95c1a5c627288e5c58c5092962997cac",
                                "fv_grade": "B",
                                "g_per_serving": 180,
                                "display_name": "Cappuccino",
                                "nutrition": {
                                  "alcohol_100g": 0,
                                  "calcium_100g": 0.0622,
                                  "calories_100g": 25,
                                  "carbs_100g": 2.7,
                                  "chloride_100g": null,
                                  "cholesterol_100g": 0.0025,
                                  "copper_100g": null,
                                  "fat_100g": 0.8,
                                  "fibers_100g": 0,
                                  "glycemic_index": 0,
                                  "insat_fat_100g": 0.2565,
                                  "iodine_100g": null,
                                  "iron_100g": 0.000127,
                                  "magnesium_100g": 0.00852,
                                  "manganese_100g": null,
                                  "mono_fat_100g": 0.233,
                                  "omega_3_100g": 0.00356,
                                  "omega_6_100g": 0.02,
                                  "phosphorus_100g": 0.0426,
                                  "poly_fat_100g": 0.0235,
                                  "polyols_100g": null,
                                  "potassium_100g": 0.108,
                                  "proteins_100g": 1.7,
                                  "salt_100g": null,
                                  "sat_fat_100g": 0.473,
                                  "selenium_100g": null,
                                  "sodium_100g": 0.0234,
                                  "sugars_100g": 2.31,
                                  "veg_percent": 0,
                                  "vitamin_a_beta_k_100g": null,
                                  "vitamin_a_retinol_100g": null,
                                  "vitamin_b12_100g": null,
                                  "vitamin_b1_100g": null,
                                  "vitamin_b2_100g": null,
                                  "vitamin_b3_100g": null,
                                  "vitamin_b5_100g": null,
                                  "vitamin_b6_100g": null,
                                  "vitamin_b9_100g": 0.0000028,
                                  "vitamin_c_100g": 0.00125,
                                  "vitamin_d_100g": null,
                                  "vitamin_e_100g": null,
                                  "vitamin_k1_100g": null,
                                  "water_100g": null,
                                  "zinc_100g": null
                                }
                              }
                            },
                            {
                              "confidence": 0,
                              "quantity": 180,
                              "ingredients": [],
                              "food_info": {
                                "food_id": "5916b717e28ee4e28e2ad540a2ab0162",
                                "fv_grade": "A",
                                "g_per_serving": 180,
                                "display_name": "Black Coffee",
                                "nutrition": {
                                  "alcohol_100g": 0,
                                  "calcium_100g": 0.004,
                                  "calories_100g": 0,
                                  "carbs_100g": 0,
                                  "chloride_100g": null,
                                  "cholesterol_100g": 0,
                                  "copper_100g": null,
                                  "fat_100g": 0,
                                  "fibers_100g": 0,
                                  "glycemic_index": 0,
                                  "insat_fat_100g": 0.005333,
                                  "iodine_100g": null,
                                  "iron_100g": 0.0000278,
                                  "magnesium_100g": 0.012,
                                  "manganese_100g": null,
                                  "mono_fat_100g": 0.005,
                                  "omega_3_100g": 0,
                                  "omega_6_100g": 0,
                                  "phosphorus_100g": 0.00267,
                                  "poly_fat_100g": 0.000333,
                                  "polyols_100g": null,
                                  "potassium_100g": 0.119,
                                  "proteins_100g": 0.1,
                                  "salt_100g": null,
                                  "sat_fat_100g": 0.000667,
                                  "selenium_100g": null,
                                  "sodium_100g": 0.00185,
                                  "sugars_100g": 0.2,
                                  "veg_percent": 0,
                                  "vitamin_a_beta_k_100g": null,
                                  "vitamin_a_retinol_100g": null,
                                  "vitamin_b12_100g": null,
                                  "vitamin_b1_100g": null,
                                  "vitamin_b2_100g": null,
                                  "vitamin_b3_100g": null,
                                  "vitamin_b5_100g": null,
                                  "vitamin_b6_100g": null,
                                  "vitamin_b9_100g": 7.5e-7,
                                  "vitamin_c_100g": 0,
                                  "vitamin_d_100g": null,
                                  "vitamin_e_100g": null,
                                  "vitamin_k1_100g": null,
                                  "water_100g": null,
                                  "zinc_100g": null
                                }
                              }
                            },
                            {
                              "confidence": 0,
                              "quantity": 180,
                              "ingredients": [],
                              "food_info": {
                                "food_id": "c0284788212d14a65b77db4d6ba6cb6a",
                                "fv_grade": "C",
                                "g_per_serving": 180,
                                "display_name": "Coffee Mocha",
                                "nutrition": {
                                  "alcohol_100g": 0,
                                  "calcium_100g": 0,
                                  "calories_100g": 79,
                                  "carbs_100g": 9.4,
                                  "chloride_100g": null,
                                  "cholesterol_100g": 0,
                                  "copper_100g": null,
                                  "fat_100g": 3.2,
                                  "fibers_100g": 0.8,
                                  "glycemic_index": 0,
                                  "insat_fat_100g": 0,
                                  "iodine_100g": null,
                                  "iron_100g": 0,
                                  "magnesium_100g": 0,
                                  "manganese_100g": null,
                                  "mono_fat_100g": 0,
                                  "omega_3_100g": 0,
                                  "omega_6_100g": 0,
                                  "phosphorus_100g": 0,
                                  "poly_fat_100g": 0,
                                  "polyols_100g": null,
                                  "potassium_100g": 0,
                                  "proteins_100g": 2.8,
                                  "salt_100g": null,
                                  "sat_fat_100g": 1.91,
                                  "selenium_100g": null,
                                  "sodium_100g": 0.032,
                                  "sugars_100g": 7.45,
                                  "veg_percent": 0,
                                  "vitamin_a_beta_k_100g": null,
                                  "vitamin_a_retinol_100g": null,
                                  "vitamin_b12_100g": null,
                                  "vitamin_b1_100g": null,
                                  "vitamin_b2_100g": null,
                                  "vitamin_b3_100g": null,
                                  "vitamin_b5_100g": null,
                                  "vitamin_b6_100g": null,
                                  "vitamin_b9_100g": 0,
                                  "vitamin_c_100g": 0,
                                  "vitamin_d_100g": null,
                                  "vitamin_e_100g": null,
                                  "vitamin_k1_100g": null,
                                  "water_100g": null,
                                  "zinc_100g": null
                                }
                              }
                            },
                            {
                              "confidence": 0,
                              "quantity": 216,
                              "ingredients": [],
                              "food_info": {
                                "food_id": "c0836158e302607934b66429ef7aaa1f",
                                "fv_grade": "D",
                                "g_per_serving": 218,
                                "display_name": "Big Mac",
                                "nutrition": {
                                  "alcohol_100g": 0,
                                  "calcium_100g": 0.116,
                                  "calories_100g": 231,
                                  "carbs_100g": 19,
                                  "chloride_100g": null,
                                  "cholesterol_100g": 0.036,
                                  "copper_100g": null,
                                  "fat_100g": 11,
                                  "fibers_100g": 1.4,
                                  "glycemic_index": 65,
                                  "insat_fat_100g": 3.8,
                                  "iodine_100g": null,
                                  "iron_100g": 0,
                                  "magnesium_100g": 0.02,
                                  "manganese_100g": null,
                                  "mono_fat_100g": 3.5,
                                  "omega_3_100g": 0,
                                  "omega_6_100g": 0,
                                  "phosphorus_100g": 0,
                                  "poly_fat_100g": 0.3,
                                  "polyols_100g": null,
                                  "potassium_100g": 0.181,
                                  "proteins_100g": 12,
                                  "salt_100g": null,
                                  "sat_fat_100g": 4.2,
                                  "selenium_100g": null,
                                  "sodium_100g": 0.46,
                                  "sugars_100g": 4,
                                  "veg_percent": 0,
                                  "vitamin_a_beta_k_100g": null,
                                  "vitamin_a_retinol_100g": null,
                                  "vitamin_b12_100g": null,
                                  "vitamin_b1_100g": null,
                                  "vitamin_b2_100g": null,
                                  "vitamin_b3_100g": null,
                                  "vitamin_b5_100g": null,
                                  "vitamin_b6_100g": null,
                                  "vitamin_b9_100g": 0,
                                  "vitamin_c_100g": 0.0004,
                                  "vitamin_d_100g": null,
                                  "vitamin_e_100g": null,
                                  "vitamin_k1_100g": null,
                                  "water_100g": null,
                                  "zinc_100g": null
                                }
                              }
                            },
                            {
                              "confidence": 0,
                              "quantity": 4,
                              "ingredients": [],
                              "food_info": {
                                "food_id": "410f2f5d30b57f16b08574a3aa8fc51a",
                                "fv_grade": "D",
                                "g_per_serving": 4,
                                "display_name": "White sugar",
                                "nutrition": {
                                  "alcohol_100g": 0,
                                  "calcium_100g": 0.00368,
                                  "calories_100g": 398,
                                  "carbs_100g": 99.6,
                                  "chloride_100g": null,
                                  "cholesterol_100g": 0,
                                  "copper_100g": null,
                                  "fat_100g": 0,
                                  "fibers_100g": 0,
                                  "glycemic_index": 70,
                                  "insat_fat_100g": 0,
                                  "iodine_100g": null,
                                  "iron_100g": 0.0000767,
                                  "magnesium_100g": 0.003,
                                  "manganese_100g": null,
                                  "mono_fat_100g": 0,
                                  "omega_3_100g": 0,
                                  "omega_6_100g": 0,
                                  "phosphorus_100g": 0,
                                  "poly_fat_100g": 0,
                                  "polyols_100g": null,
                                  "potassium_100g": 0.0134,
                                  "proteins_100g": 0,
                                  "salt_100g": null,
                                  "sat_fat_100g": 0,
                                  "selenium_100g": null,
                                  "sodium_100g": 0.00217,
                                  "sugars_100g": 99,
                                  "veg_percent": 0,
                                  "vitamin_a_beta_k_100g": null,
                                  "vitamin_a_retinol_100g": null,
                                  "vitamin_b12_100g": null,
                                  "vitamin_b1_100g": null,
                                  "vitamin_b2_100g": null,
                                  "vitamin_b3_100g": null,
                                  "vitamin_b5_100g": null,
                                  "vitamin_b6_100g": null,
                                  "vitamin_b9_100g": 0,
                                  "vitamin_c_100g": 0,
                                  "vitamin_d_100g": null,
                                  "vitamin_e_100g": null,
                                  "vitamin_k1_100g": null,
                                  "water_100g": null,
                                  "zinc_100g": null
                                }
                              }
                            },
                            {
                              "confidence": 0,
                              "quantity": 5,
                              "ingredients": [],
                              "food_info": {
                                "food_id": "f06d6683b0e1c0effa99e3824d5de023",
                                "fv_grade": "D",
                                "g_per_serving": 5,
                                "display_name": "Sugar with aspartame sweetner",
                                "nutrition": {
                                  "alcohol_100g": 0,
                                  "calcium_100g": 0,
                                  "calories_100g": 398,
                                  "carbs_100g": 98.7,
                                  "chloride_100g": null,
                                  "cholesterol_100g": 0,
                                  "copper_100g": null,
                                  "fat_100g": 0,
                                  "fibers_100g": 0,
                                  "glycemic_index": 70,
                                  "insat_fat_100g": 0,
                                  "iodine_100g": null,
                                  "iron_100g": 0,
                                  "magnesium_100g": 0,
                                  "manganese_100g": null,
                                  "mono_fat_100g": 0,
                                  "omega_3_100g": 0,
                                  "omega_6_100g": 0,
                                  "phosphorus_100g": 0,
                                  "poly_fat_100g": 0,
                                  "polyols_100g": null,
                                  "potassium_100g": 0,
                                  "proteins_100g": 0.8,
                                  "salt_100g": null,
                                  "sat_fat_100g": 0,
                                  "selenium_100g": null,
                                  "sodium_100g": 0.0018,
                                  "sugars_100g": 98.7,
                                  "veg_percent": 0,
                                  "vitamin_a_beta_k_100g": null,
                                  "vitamin_a_retinol_100g": null,
                                  "vitamin_b12_100g": null,
                                  "vitamin_b1_100g": null,
                                  "vitamin_b2_100g": null,
                                  "vitamin_b3_100g": null,
                                  "vitamin_b5_100g": null,
                                  "vitamin_b6_100g": null,
                                  "vitamin_b9_100g": 0,
                                  "vitamin_c_100g": 0,
                                  "vitamin_d_100g": null,
                                  "vitamin_e_100g": null,
                                  "vitamin_k1_100g": null,
                                  "water_100g": null,
                                  "zinc_100g": null
                                }
                              }
                            },
                            {
                              "confidence": 0,
                              "quantity": 5,
                              "ingredients": [],
                              "food_info": {
                                "food_id": "9521f13e3f1994e4bdcdfbc1acaac2ff",
                                "fv_grade": "D",
                                "g_per_serving": 5,
                                "display_name": "Aspartame sweetener",
                                "nutrition": {
                                  "alcohol_100g": 0,
                                  "calcium_100g": 0,
                                  "calories_100g": 52,
                                  "carbs_100g": 0,
                                  "chloride_100g": null,
                                  "cholesterol_100g": 0,
                                  "copper_100g": null,
                                  "fat_100g": 0,
                                  "fibers_100g": 0,
                                  "glycemic_index": 0,
                                  "insat_fat_100g": 0,
                                  "iodine_100g": null,
                                  "iron_100g": 0,
                                  "magnesium_100g": 0,
                                  "manganese_100g": null,
                                  "mono_fat_100g": 0,
                                  "omega_3_100g": 0,
                                  "omega_6_100g": 0,
                                  "phosphorus_100g": 0,
                                  "poly_fat_100g": 0,
                                  "polyols_100g": null,
                                  "potassium_100g": 0,
                                  "proteins_100g": 13,
                                  "salt_100g": null,
                                  "sat_fat_100g": 0,
                                  "selenium_100g": null,
                                  "sodium_100g": 0,
                                  "sugars_100g": 0,
                                  "veg_percent": 0,
                                  "vitamin_a_beta_k_100g": null,
                                  "vitamin_a_retinol_100g": null,
                                  "vitamin_b12_100g": null,
                                  "vitamin_b1_100g": null,
                                  "vitamin_b2_100g": null,
                                  "vitamin_b3_100g": null,
                                  "vitamin_b5_100g": null,
                                  "vitamin_b6_100g": null,
                                  "vitamin_b9_100g": 0,
                                  "vitamin_c_100g": 0,
                                  "vitamin_d_100g": null,
                                  "vitamin_e_100g": null,
                                  "vitamin_k1_100g": null,
                                  "water_100g": null,
                                  "zinc_100g": null
                                }
                              }
                            }
                          ]
                        },
                        {
                          "position": {
                            "x": 0.813,
                            "y": 0.4792,
                            "width": 0.1333,
                            "height": 0.0568
                          },
                          "food": [
                            {
                              "confidence": 0.6926,
                              "quantity": 16,
                              "ingredients": [],
                              "food_info": {
                                "food_id": "7bc19d3cd18bb26e56d29ed48ddebc41",
                                "fv_grade": "C",
                                "g_per_serving": 16,
                                "display_name": "The Laughing Cow",
                                "nutrition": {
                                  "alcohol_100g": 0,
                                  "calcium_100g": 0.492,
                                  "calories_100g": 283,
                                  "carbs_100g": 2.8,
                                  "chloride_100g": null,
                                  "cholesterol_100g": 0.07,
                                  "copper_100g": null,
                                  "fat_100g": 22.700000000000003,
                                  "fibers_100g": 0,
                                  "glycemic_index": 0,
                                  "insat_fat_100g": 7.5,
                                  "iodine_100g": null,
                                  "iron_100g": 0.0008,
                                  "magnesium_100g": 0.02,
                                  "manganese_100g": null,
                                  "mono_fat_100g": 6.9,
                                  "omega_3_100g": 0.21,
                                  "omega_6_100g": 0.38,
                                  "phosphorus_100g": 0.754,
                                  "poly_fat_100g": 0.6,
                                  "polyols_100g": null,
                                  "potassium_100g": 0.149,
                                  "proteins_100g": 16.8,
                                  "salt_100g": null,
                                  "sat_fat_100g": 13.5,
                                  "selenium_100g": null,
                                  "sodium_100g": 1.139,
                                  "sugars_100g": 2.8,
                                  "veg_percent": 0,
                                  "vitamin_a_beta_k_100g": null,
                                  "vitamin_a_retinol_100g": null,
                                  "vitamin_b12_100g": null,
                                  "vitamin_b1_100g": null,
                                  "vitamin_b2_100g": null,
                                  "vitamin_b3_100g": null,
                                  "vitamin_b5_100g": null,
                                  "vitamin_b6_100g": null,
                                  "vitamin_b9_100g": 0.000016,
                                  "vitamin_c_100g": 0,
                                  "vitamin_d_100g": null,
                                  "vitamin_e_100g": null,
                                  "vitamin_k1_100g": null,
                                  "water_100g": null,
                                  "zinc_100g": null
                                }
                              }
                            },
                            {
                              "confidence": 0.0731,
                              "quantity": 125,
                              "ingredients": [],
                              "food_info": {
                                "food_id": "d6acfba4498d60c98c8e4fdf6c4b6658",
                                "fv_grade": "C",
                                "g_per_serving": 125,
                                "display_name": "Fresh goat cheese",
                                "nutrition": {
                                  "alcohol_100g": 0,
                                  "calcium_100g": 0.0966,
                                  "calories_100g": 253,
                                  "carbs_100g": 2,
                                  "chloride_100g": null,
                                  "cholesterol_100g": 0.0738,
                                  "copper_100g": null,
                                  "fat_100g": 19.9,
                                  "fibers_100g": 0.7,
                                  "glycemic_index": 0,
                                  "insat_fat_100g": 5.11,
                                  "iodine_100g": null,
                                  "iron_100g": 0.000237,
                                  "magnesium_100g": 0.0112,
                                  "manganese_100g": null,
                                  "mono_fat_100g": 4.39,
                                  "omega_3_100g": 0,
                                  "omega_6_100g": 0,
                                  "phosphorus_100g": 0.162,
                                  "poly_fat_100g": 0.72,
                                  "polyols_100g": null,
                                  "potassium_100g": 0.026,
                                  "proteins_100g": 16.1,
                                  "salt_100g": null,
                                  "sat_fat_100g": 13.4,
                                  "selenium_100g": null,
                                  "sodium_100g": 0.404,
                                  "sugars_100g": 2.05,
                                  "veg_percent": 0,
                                  "vitamin_a_beta_k_100g": null,
                                  "vitamin_a_retinol_100g": null,
                                  "vitamin_b12_100g": null,
                                  "vitamin_b1_100g": null,
                                  "vitamin_b2_100g": null,
                                  "vitamin_b3_100g": null,
                                  "vitamin_b5_100g": null,
                                  "vitamin_b6_100g": null,
                                  "vitamin_b9_100g": 0.0000508,
                                  "vitamin_c_100g": 0,
                                  "vitamin_d_100g": null,
                                  "vitamin_e_100g": null,
                                  "vitamin_k1_100g": null,
                                  "water_100g": null,
                                  "zinc_100g": null
                                }
                              }
                            },
                            {
                              "confidence": 0.0002,
                              "quantity": 5,
                              "ingredients": [],
                              "food_info": {
                                "food_id": "ada589e1d0a994c306fd2702a8b145ff",
                                "fv_grade": "D",
                                "g_per_serving": 5,
                                "display_name": "Butter",
                                "nutrition": {
                                  "alcohol_100g": 0,
                                  "calcium_100g": 0.0165,
                                  "calories_100g": 747,
                                  "carbs_100g": 1,
                                  "chloride_100g": null,
                                  "cholesterol_100g": 0.224,
                                  "copper_100g": null,
                                  "fat_100g": 82.19999999999999,
                                  "fibers_100g": 0,
                                  "glycemic_index": 0,
                                  "insat_fat_100g": 21.11,
                                  "iodine_100g": null,
                                  "iron_100g": 0.0000873,
                                  "magnesium_100g": 0.00203,
                                  "manganese_100g": null,
                                  "mono_fat_100g": 18.2,
                                  "omega_3_100g": 0.3613,
                                  "omega_6_100g": 1.09,
                                  "phosphorus_100g": 0.024,
                                  "poly_fat_100g": 2.91,
                                  "polyols_100g": null,
                                  "potassium_100g": 0.0178,
                                  "proteins_100g": 0.7,
                                  "salt_100g": null,
                                  "sat_fat_100g": 54.9,
                                  "selenium_100g": null,
                                  "sodium_100g": 0.0155,
                                  "sugars_100g": 0.58,
                                  "veg_percent": 0,
                                  "vitamin_a_beta_k_100g": null,
                                  "vitamin_a_retinol_100g": null,
                                  "vitamin_b12_100g": null,
                                  "vitamin_b1_100g": null,
                                  "vitamin_b2_100g": null,
                                  "vitamin_b3_100g": null,
                                  "vitamin_b5_100g": null,
                                  "vitamin_b6_100g": null,
                                  "vitamin_b9_100g": 0.000002,
                                  "vitamin_c_100g": 0,
                                  "vitamin_d_100g": null,
                                  "vitamin_e_100g": null,
                                  "vitamin_k1_100g": null,
                                  "water_100g": null,
                                  "zinc_100g": null
                                }
                              }
                            }
                          ]
                        }
                      ]
                    }
        """
    }
    
    func callAPI(inputImageData: Data) async {
        let parameters = [
            [
                "key": "image",
                "src": "BintangTestProjectFVMobile/tomatoes_test.jpeg",
                "type": "file"
            ]] as [[String: Any]]
        
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = Data()
        //var error: Error? = nil
        for param in parameters {
            
            if param["disabled"] != nil { continue }
            
            let paramName = param["key"]!
            
            body += Data("--\(boundary)\r\n".utf8)
            body += Data("Content-Disposition:form-data; name=\"\(paramName)\"".utf8)
            
            if param["contentType"] != nil {
                body += Data("\r\nContent-Type: \(param["contentType"] as! String)".utf8)
            }
            
            let paramType = param["type"] as! String
            
            if paramType == "text" {
                let paramValue = param["value"] as! String
                
                body += Data("\r\n\r\n\(paramValue)\r\n".utf8)
            } else {
                let paramSrc = param["src"] as! String
                body += Data("; filename=\"\(paramSrc)\"\r\n".utf8)
                body += Data("Content-Type: \"content-type header\"\r\n".utf8)
                body += Data("\r\n".utf8)
                body += inputImageData
                body += Data("\r\n".utf8)
                
            }
        }
        body += Data("--\(boundary)--\r\n".utf8);
        let postData = body
        
        
        var request = URLRequest(url: URL(string: "https://vision.foodvisor.io/api/1.0/en/analysis/")!,timeoutInterval: Double.infinity)
        request.addValue("Api-Key gxFWqPbf.0bc2cJby2xtW3FF9y9bsZbMnu8b6Qi1c", forHTTPHeaderField: "Authorization")
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            //print(String(data: data, encoding: .utf8)!)
            let resultjsonstr: String = String(data: data, encoding: .utf8) ?? "WHAT"
            self.handleAnalysis(inputJSONData: resultjsonstr)
            return
        }
        task.resume()
        
    }
    
    func handleAnalysis(inputJSONData: String) {
//        let returnedJSON = getDummyJSON()
        let jsonData = inputJSONData.data(using: .utf8)!
        let decoder = JSONDecoder()
        //decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let curanalysis = try? decoder.decode(Analysis.self, from: jsonData){
            guard !curanalysis.items.isEmpty else {
                print("SOMETHING IS FUCKED")
                return
            }
            let curFood = curanalysis.items[0].food[0]
            
            
            print(curFood.food_info.display_name)
            print(curFood.quantity)
            print(curFood.food_info.nutrition.fat_100g ?? 0)
            print(curFood.food_info.nutrition.carbs_100g ?? 0)
            print(curFood.food_info.nutrition.proteins_100g ?? 0)
            
            let qfactor = (Double(curFood.quantity)/100)
            
            Task { @MainActor in
                analysis = curanalysis
                fat = (curFood.food_info.nutrition.fat_100g ?? 0) * qfactor
                carbo = (curFood.food_info.nutrition.carbs_100g ?? 0) * qfactor
                protein = (curFood.food_info.nutrition.proteins_100g ?? 0) * qfactor
                
                let nf = NumberFormatter()
                nf.numberStyle = .decimal
                nf.groupingSeparator = ""
                nf.decimalSeparator = ","
                nf.maximumFractionDigits = 1
                
                textInput1 = nf.string(from: fat as NSNumber) ?? ""
                textInput2 = nf.string(from: carbo as NSNumber) ?? ""
                textInput3 = nf.string(from: protein as NSNumber) ?? ""
                
                isWaitingForAPI = false
                
                withAnimation{
                    selectedDetent = .open
                }
                
            }
        } else {
            print("SOMETHING IS FUCKED")
        }
        
    }
    
    func handleCameraPreviews() async {
        let imageStream = camera.previewStream
            .map { $0.image }

        for await image in imageStream {
            Task { @MainActor in
                viewfinderImage = image
            }
        }
    }
    
    func handleCameraPhotos() async {
        let unpackedPhotoStream = camera.photoStream
            .compactMap { self.unpackPhoto($0) }
        
        for await photoData in unpackedPhotoStream {
            Task { @MainActor in
                thumbnailImage = photoData.thumbnailImage
            }
            print(photoData.imageSize)
            //THIS IS HOW TO HANDLE CAMERA PHOTOS
            //savePhoto(imageData: photoData.imageData)
            
            await callAPI(inputImageData: photoData.imageData)
        }
    }
    
    private func unpackPhoto(_ photo: AVCapturePhoto) -> PhotoData? {
        guard let imageData = photo.fileDataRepresentation() else { return nil }

        guard let previewCGImage = photo.previewCGImageRepresentation(),
           let metadataOrientation = photo.metadata[String(kCGImagePropertyOrientation)] as? UInt32,
              let cgImageOrientation = CGImagePropertyOrientation(rawValue: metadataOrientation) else { return nil }
        let imageOrientation = Image.Orientation(cgImageOrientation)
        let thumbnailImage = Image(decorative: previewCGImage, scale: 1, orientation: imageOrientation)
        
        let photoDimensions = photo.resolvedSettings.photoDimensions
        let imageSize = (width: Int(photoDimensions.width), height: Int(photoDimensions.height))
        let previewDimensions = photo.resolvedSettings.previewDimensions
        let thumbnailSize = (width: Int(previewDimensions.width), height: Int(previewDimensions.height))
        
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = [.useMB] // optional: restricts the units to MB only
        bcf.countStyle = .file
        let string = bcf.string(fromByteCount: Int64(imageData.count))
        print("CAPTURED DATA")
        print("size: \(imageData.count)")
        print("size MB: \(string)")
        
        return PhotoData(thumbnailImage: thumbnailImage, thumbnailSize: thumbnailSize, imageData: imageData, imageSize: imageSize)
    }
}

fileprivate struct PhotoData {
    var thumbnailImage: Image
    var thumbnailSize: (width: Int, height: Int)
    var imageData: Data
    var imageSize: (width: Int, height: Int)
}

fileprivate extension CIImage {
    var image: Image? {
        let ciContext = CIContext()
        guard let cgImage = ciContext.createCGImage(self, from: self.extent) else { return nil }
        return Image(decorative: cgImage, scale: 1, orientation: .up)
    }
}

fileprivate extension Image.Orientation {
    init(_ cgImageOrientation: CGImagePropertyOrientation) {
        switch cgImageOrientation {
        case .up: self = .up
        case .upMirrored: self = .upMirrored
        case .down: self = .down
        case .downMirrored: self = .downMirrored
        case .left: self = .left
        case .leftMirrored: self = .leftMirrored
        case .right: self = .right
        case .rightMirrored: self = .rightMirrored
        }
    }
}

fileprivate let logger = Logger()
