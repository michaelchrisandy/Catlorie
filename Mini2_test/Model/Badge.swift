//
//  Badge.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 19/06/24.
//

import Foundation
import SwiftData

class Badge: Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var image: String
    
    init(id: UUID, name: String, description: String, image: String) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
    }
}
