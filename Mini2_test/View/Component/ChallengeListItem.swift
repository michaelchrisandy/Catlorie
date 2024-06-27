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
    var isCompleted: Bool
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("CustomOrange"))
                .cornerRadius(20)
                .frame(width: 220, height: 85)
            
            VStack(alignment: .leading){
                HStack {
                    Text("Challenge \(challengeCount)")
                        .opacity(0.6)
                    
                    Image(systemName: isCompleted ? "checkmark.circle" : "")
                        .padding(.leading, 50)
                }
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
    ChallengeListItem(challengeCount: 1, reward: 10, challengeTitle: "Drink Milk", isCompleted: true)
}
