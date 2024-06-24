//
//  Badge.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 19/06/24.
//

import Foundation
import SwiftData

@Model
class Badge: Identifiable {
    var id: UUID = UUID()
    var name: String
    var desc: String
    var image: String
    var category: BadgeCategory
    var price: Int
    var isUsed: Bool = false
    var isUnlocked: Bool = false
    var x: Int
    var y: Int
    
    init(id: UUID = UUID(), name: String, desc: String, image: String, category: BadgeCategory, price: Int, x: Int, y: Int) {
        self.name = name
        self.desc = desc
        self.image = image
        self.category = category
        self.price = price
        self.x = x
        self.y = y
    }
}

enum BadgeCategory: String, Codable, CaseIterable {
    case hat
    case tree
    case necklace
    case toy
    case food
}
