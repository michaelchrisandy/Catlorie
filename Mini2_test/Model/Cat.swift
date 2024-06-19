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
    var name: String?
    var image: String?
    var weight: Float?
    var badges: [Badge]? 
    
    init(id: UUID, name: String, image: String, weight: Float, badges: [Badge]){
        self.name = name
        self.image = image
        self.weight = weight
        self.badges = badges
    }
}


