//
//  BadgesView.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 20/06/24.
//

import SwiftUI
import SwiftData

struct BadgesView: View {
    
    @Query var user: [User]
    let columns = [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)]
    
    @State private var draggedBadge: Badge?
    @State private var dragPosition: CGPoint = .zero
    
    var body: some View {
        VStack {
            Text("Badges")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(2)
            
            Image("catpic")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
                .overlay(
                    GeometryReader { geometry in
                        if let badge = draggedBadge {
                            Image(badge.image)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .position(dragPosition)
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            dragPosition = value.location
                                        }
                                        .onEnded { _ in
                                            if let firstUser = user.first {
                                                firstUser.cat.badges.append(badge)
                                                draggedBadge = nil
                                            }
                                        }
                                )
                        }
                    }
                )
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(user[0].cat.badges) { badge in
                        ZStack {
                            Circle()
                                .fill(Color("CustomYellow"))
                                .frame(width: 90)
                                .shadow(radius: 4, x: 2, y: 2)
                            Image(badge.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80)
                        }
                        .onTapGesture {
                            draggedBadge = badge
                            dragPosition = CGPoint(x: 100, y: 100) // Initial drag position
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    BadgesView()
}
