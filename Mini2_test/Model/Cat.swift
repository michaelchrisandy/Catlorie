//
//  Cat.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 19/06/24.
//

import Foundation
import SwiftData

@Model
class Cat: Identifiable {
    var id: UUID = UUID()
    
    var catWeightCategory: CatWeightCategory{
        didSet{
            updateImage()
        }
    }
    var catExpressionCategory: CatExpressionCategory{
        didSet{
            updateImage()
        }
    }
    
    var image: String?
    @Relationship(deleteRule: .cascade) var badges = [Badge]()

    init(id: UUID = UUID(), catWeightCategory: CatWeightCategory, catExpressionCategory: CatExpressionCategory){
        self.catWeightCategory = catWeightCategory
        self.catExpressionCategory = catExpressionCategory
        updateImage(catWeightCategory: catWeightCategory, catExpressionCategory: catExpressionCategory)
    }
    
    
    func updateImage(catWeightCategory: CatWeightCategory, catExpressionCategory: CatExpressionCategory){
//        print("update image")
        var imageName : String = ""
        imageName = String("\(catWeightCategory)\(catExpressionCategory)")
        print(imageName)
        
        self.image = imageName

    }
    
}

enum CatWeightCategory: String, Codable, CaseIterable{
    case skinny
    case ideal
    case overweight
}

enum CatExpressionCategory: String, Codable, CaseIterable{
    case sad
    case smile
    case happy
}


