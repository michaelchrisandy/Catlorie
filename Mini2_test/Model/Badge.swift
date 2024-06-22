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
    var isUsed: Bool = false
    
    init(id: UUID = UUID(), name: String, desc: String, image: String, category: BadgeCategory) {
        self.name = name
        self.desc = desc
        self.image = image
        self.category = category
    }
}

enum BadgeCategory: String, Codable, CaseIterable {
    case hat
    case tree
    case necklace
    case toy
    case food
}
