//
//  ChallengeListItem.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 24/06/24.
//

import SwiftUI

struct ChallengeListItem: View {
    
    var challengeCount, reward: Int
    var challengeTitle: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("CustomOrange"))
                .cornerRadius(20)
                .frame(width: 220, height: 85)
            
            VStack(alignment: .leading){
                Text("Challenge \(challengeCount)")
                    .opacity(0.6)
                Text(challengeTitle)
                Text("+ \(reward) coins")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.leading, 100)
            }
            .foregroundStyle(.white)
            .fontWeight(.heavy)
            .frame(width: 200)
        }
    }
}

#Preview {
    ChallengeListItem(challengeCount: 1, reward: 10, challengeTitle: "Drink Milk")
}
