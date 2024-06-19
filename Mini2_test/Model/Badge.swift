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
    var name: String?
    var desc: String?
    var image: String?
    
    init(name: String, desc: String, image: String) {
        self.name = name
        self.desc = desc
        self.image = image
    }
}
