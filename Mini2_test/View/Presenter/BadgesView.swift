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
    @Query var badges: [Badge]
    @Query var cat: [Cat]
    let columns = [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)]
    
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
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(badges) { badge in
                        ZStack {
                            Circle()
                                .fill(Color("CustomYellow"))
                                .frame(width: 90)
                                .shadow(radius: 4, x: 2, y: 2)
                            Image(badge.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80)
                            if let cat = user.first?.cat {
                                ForEach(cat.badges) { badge in
                                    if badge.category == .hat {
                                        Text(badge.name)
                                    }
                                }
                            }
                        }
                        .onTapGesture {
                            assignBadgeToCat(badge)
                            print("after assigning: \(user[0].cat.badges.count)")
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear{
            print("badges count: \(badges.count)")
            print("cats count: \(cat.count)")
            print("users count: \(user.count)")
            print("on appear: \(user[0].cat.badges.count)")
        }
    }
    
    private func assignBadgeToCat(_ badge: Badge) {
        if let user = user.first {
            if !user.cat.badges.contains(where: { $0.id == badge.id }) && !badge.isUsed{
                user.cat.badges.append(badge)
                badge.isUsed = true
                print("Badge assigned to cat")
            } else {
                print("Badge already assigned to cat")
            }
        }
    }
}

#Preview {
    BadgesView()
}