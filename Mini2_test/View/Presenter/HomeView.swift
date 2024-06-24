//
//  ContentView.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 13/06/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    //    @Environment(\.modelContext) var modelContext
    //    @Query var user: [User]
    //    @Query var badges: [Badge]
    //    @Query var cat: [Cat]
    @State private var progress: Float = 0.5
        
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    ExtractedView()
                    
                    HalfCircularProgressView(percentage: $progress)
                        .frame(width: 250.0, height: 250.0)
                        .padding()
                        .padding(.bottom, -120)
                    
                    Image("cat_fit_normal")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200)
                        .offset(x: 20)
                    
                    //foreach badge, offset => badge.x badge.y
                    
                    HStack(spacing: -20){
                        CircularProgressView(percentage: 0.6, category: "A")
                        CircularProgressView(percentage: 0.8, category: "B")
                        CircularProgressView(percentage: 0.4, category: "C")
                    }
                    .padding(.bottom, -20)
                    
                    NavigationLink{
                        
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
                                    Text("Complete today’s challenges 0/3")
                                }
                                .foregroundStyle(.gray)
                                .opacity(0.8)
                                .padding(.bottom, 20)
                                
                                ForEach(1..<4) {count in
                                    ChallengeListItem(challengeCount: count, reward: 10, challengeTitle: "Drink Milk")
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
        //        .onAppear{
        //            deleteAllUsers()
        //            deleteAllCats()
        //            deleteAllBadges()
        //            addSampleData()
        //            if let user = user.first {
        //                print(user.dailyNutrition[0].calories)
        //            }
        //        }
    }
    
    //    func deleteAllUsers() {
    //        for user in user {
    //            modelContext.delete(user)
    //        }
    //
    //        do {
    //            try modelContext.save()
    //        } catch {
    //            print("Error saving context after deletion: \(error.localizedDescription)")
    //        }
    //    }
    
    //    func deleteAllCats() {
    //        for cat in cat {
    //            modelContext.delete(cat)
    //        }
    //
    //        do {
    //            try modelContext.save()
    //        } catch {
    //            print("Error saving context after deletion: \(error.localizedDescription)")
    //        }
    //    }
    //
    //    func deleteAllBadges() {
    //        for badge in badges {
    //            modelContext.delete(badge)
    //        }
    //
    //        do {
    //            try modelContext.save()
    //        } catch {
    //            print("Error saving context after deletion: \(error.localizedDescription)")
    //        }
    //    }
    
    //    func addSampleData(){
    //        let badge1 = Badge(name: "Hat 1", desc: "2 day streak", image: "hatpic", category: BadgeCategory.hat)
    //        let badge2 = Badge(name: "Hat 2", desc: "3 day streak", image: "cap", category: BadgeCategory.hat)
    //        let badge3 = Badge(name: "Hat 3", desc: "4 day streak", image: "hat", category: BadgeCategory.hat)
    //        let badge4 = Badge(name: "Party Hat", desc: "5 day streak", image: "party-hat", category: BadgeCategory.hat)
    //
    //        modelContext.insert(badge1)
    //        modelContext.insert(badge2)
    //        modelContext.insert(badge3)
    //        modelContext.insert(badge4)
    //
    //        let cat = Cat(name: "Hose", image: "catpic", weight: 20)
    //        modelContext.insert(cat)
    //
    //        let user = User(name: "Aaron",
    //                        targetCalories: 2000,
    //                        targetCarbohydrates: 225,
    //                        targetProtein: 65,
    //                        targetFat: 45,
    //                        cat: cat
    //        )
    //        modelContext.insert(user)
    //
    //        user.dailyNutrition.append(DailyNutrition(date: Date(),
    //                                                  calories: 1800,
    //                                                  protein: 60,
    //                                                  carbohydrates: 200,
    //                                                  fat: 50)
    //        )
    //        user.dailyNutrition.append(DailyNutrition(date:
    //                                                    Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
    //                                                  calories: 2200,
    //                                                  protein: 80,
    //                                                  carbohydrates: 250,
    //                                                  fat: 70)
    //        )
    //        user.dailyNutrition.append(DailyNutrition(date:
    //                                                    Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
    //                                                  calories: 1500,
    //                                                  protein: 55,
    //                                                  carbohydrates: 150,
    //                                                  fat: 45)
    //        )
    //    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.light)
}

struct ExtractedView: View {
    var body: some View {
        NavigationStack {
            HStack{
                NavigationLink{
                    
                }label: {
                    ToolBarIcon(text: "7", image: "flame", color: "red")
                }
                
                Spacer()
                
                NavigationLink{
                    //                    BadgesView()
                }label: {
                    ToolBarIcon(text: "100", image: "dollarsign.circle", color: "green")
                }
            }
            .padding()
            .padding(.vertical, -20)
        }
    }
}

