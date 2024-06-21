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
    let columns = [GridItem(.flexible(), spacing: -40), GridItem(.flexible(), spacing: -40), GridItem(.flexible(), spacing: -40)]
    
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
            
            ScrollView{
                LazyVGrid(columns: columns, spacing: 30){
                    ForEach(user[0].cat.badges){ badge in
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
                        .padding(.horizontal, 1)
                    }
                }
            }
        }
    }
}

#Preview {
    BadgesView()
}
