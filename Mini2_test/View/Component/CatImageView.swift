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
    @State private var isBadgeVisible = false
    
    var body: some View {
        ZStack {
            Image(cat.image ?? "cat_fit_normal")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .padding(.vertical, 50)
            
            ForEach(cat.badges) { badge in
                Group {
                    if badge.category == .Background {
                        Image(badge.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 160)
                            .position(x: CGFloat(badge.x), y: CGFloat(badge.y))
                            .zIndex(-1)
                            .scaleEffect(isBadgeVisible ? 1 : 0.1)
                            .opacity(isBadgeVisible ? 1 : 0)
                            .animation(.easeOut(duration: 0.5).delay(0.2), value: isBadgeVisible)
                    } else if badge.category == .Accessories {
                        Image("\(badge.image)_\(cat.catWeightCategory)")
                            .position(x: CGFloat(badge.x), y: CGFloat(badge.y))
                            .scaleEffect(isBadgeVisible ? 1 : 0.1)
                            .opacity(isBadgeVisible ? 1 : 0)
                    } else {
                        Image(badge.image)
                            .position(x: CGFloat(badge.x), y: CGFloat(badge.y))
                            .scaleEffect(isBadgeVisible ? 1 : 0.1)
                            .opacity(isBadgeVisible ? 1 : 0)
                            .animation(.easeOut(duration: 0.5).delay(0.2), value: isBadgeVisible)
                    }
                }
                .offset(x: CGFloat(customBadgeOffsetX), y: CGFloat(customBadgeOffsetY))
            }
        }
        .onAppear {
            isBadgeVisible = true
        }
    }
}
