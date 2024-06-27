//
//  ContentView.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 13/06/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var user: [User]
    @Query var badges: [Badge]
    @Query var cat: [Cat]
    @Query var challenges: [Challenge]
    @State private var progress: Float = 0.5
    @State private var showSheet = false
    @State private var completedChallenge: Challenge?
    @State private var completedChallengeCount: Int = 0
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    ExtractedView(coin: user[0].coin)
                    
                    HalfCircularProgressView(target: user[0].targetCalories!, currentCalories: user[0].dailyNutrition[0].calories)
                        .frame(width: 250.0, height: 250.0)
                        .padding()
                        .padding(.bottom, -120)
                    
                    if let cat = user.first?.cat {
                        CatImageView(cat: cat, customBadgeOffsetX: 20, customBadgeOffsetY: 4)
                    }
                    
                    //foreach badge, offset => badge.x badge.y
                    
                    HStack(spacing: 50){
                        CircularProgressView(percentage: Double(user[0].dailyNutrition[0].carbohydrates/user[0].targetCarbohydrates!), category: "Carb", amount: user[0].dailyNutrition[0].carbohydrates)
                        CircularProgressView(percentage: Double(user[0].dailyNutrition[0].protein/user[0].targetProtein!), category: "Protein", amount: user[0].dailyNutrition[0].protein)
                        CircularProgressView(percentage: Double(user[0].dailyNutrition[0].fat/user[0].targetFat!), category: "Fat", amount: user[0].dailyNutrition[0].fat)
                    }
                    .padding()
                    
                    NavigationLink{
                        CameraView(completedChallenge: $completedChallenge, completedChallengeCount: $completedChallengeCount)
                    }label: {
                        CustomButton(text: "+ Track eat")
                    }
                    .padding()
                    .padding(.bottom, -6)
                    
                    NavigationLink{
                        
                    }label: {
                        Text("set new target")
                            .underline()
                            .foregroundStyle(.black)
                            .opacity(0.3)
                    }
                    
                    VStack{
                        ZStack {
                            Rectangle()
                                .fill(Color("CustomYellow"))
                                .cornerRadius(20)
                                .frame(height: 350)
                                .opacity(0.3)
                            
                            VStack {
                                HStack {
                                    Image(systemName: "trophy")
                                    Text("Complete today’s challenges \(completedChallengeCount)/3")
                                }
                                .foregroundStyle(.gray)
                                .opacity(0.8)
                                .padding(.bottom, 20)
                                
                                ForEach(Array(challenges.enumerated()), id: \.element.id) { index, challenge in
                                    ChallengeListItem(challengeCount: index + 1, reward: challenge.reward, challengeTitle: challenge.title, isCompleted: challenge.isCompleted)
                                }
                                .offset(x: -45)
                            }
                            .padding(.vertical, 20)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
        .onChange(of: completedChallenge) { newValue in
            if let _ = newValue {
                showSheet = true
            }
        }
        .sheet(isPresented: $showSheet) {
            if let challenge = completedChallenge {
                ChallengeCompletedView(cat: cat[0], challenge: challenge, hasBadges: !cat[0].badges.isEmpty)
            }
        }
    }
}

struct ExtractedView: View {
    
    var coin: Int
    
    var body: some View {
        NavigationStack {
            HStack{
                NavigationLink{
                    
                }label: {
                    ToolBarIcon(text: "7", image: "flame", color: "red")
                }
                
                Spacer()
                
                NavigationLink{
                    BadgesView()
                }label: {
                    ToolBarIcon(text: "\(coin)", image: "dollarsign.circle", color: "green")
                }
            }
            .padding()
            .padding(.vertical, -20)
        }
    }
}

