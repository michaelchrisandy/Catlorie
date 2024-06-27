//
//  CatImageView.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 26/06/24.
//

import SwiftUI


struct CatImageView: View {
    
    var cat: Cat
    var customBadgeOffsetX: Int = 0
    var customBadgeOffsetY: Int = 0
    
    var body: some View {
        ZStack {
            Image(cat.image ?? "cat_fit_normal")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .padding(.vertical, 50)
            
            ForEach(cat.badges) { badge in
                if badge.category == .Background {
                    Image(badge.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160)
                        .position(x: CGFloat(badge.x), y: CGFloat(badge.y))
                        .zIndex(-1)
                } else if badge.category == .Accessories{
                    Image("\(badge.image)_\(cat.catWeightCategory)")
                        .position(x: CGFloat(badge.x), y: CGFloat(badge.y))
                }else {
                    Image(badge.image)
                        .position(x: CGFloat(badge.x), y: CGFloat(badge.y))
                }
            }
            .offset(x: CGFloat(customBadgeOffsetX), y: CGFloat(customBadgeOffsetY))
        }
    }
}
