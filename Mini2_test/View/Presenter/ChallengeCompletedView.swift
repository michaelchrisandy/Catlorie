//
//  ChallengeCompletedView.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 26/06/24.
//

import Foundation
import SwiftUI

struct ChallengeCompletedView: View {
    
    var cat: Cat
    var challenge: Challenge
    var hasBadges: Bool
    @State var play = true
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                VStack(spacing: 10) {
                    Text("Challenge Completed!")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("CustomOrange"))
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    
                    Text(challenge.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("CustomOrange"))
                }
                .padding(.top, 30)
                .padding(.bottom, hasBadges ? -100 : 0)
                
                CatImageView(cat: cat, customBadgeOffsetX: 20, customBadgeOffsetY: 100)
                
                HStack{
                    Image(systemName: "dollarsign.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                    Text("+\(challenge.reward)")
                        .font(.system(size: 60))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("CustomOrange"))
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                }
                .foregroundStyle(Color("CustomOrange"))
                .padding(.top, hasBadges ? -100 : 0)
                
                Button(action: {
                    dismiss()
                }) {
                    CustomButton(text: "Continue")
                }
                .padding(.bottom, 100)
                Spacer()
            }
            
            LottieView(name: "Confetti",
                       loopMode: .loop,
                       animationSpeed: 2,
                       contentMode: .scaleAspectFill,
                       play: $play)
            .allowsHitTesting(false)
        }
        .padding()
        .ignoresSafeArea()
    }
}

