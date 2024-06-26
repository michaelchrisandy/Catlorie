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
                                
                                ForEach(challenges) {challenge in
                                    ChallengeListItem(challengeCount: challenge.isCompleted ? 1 : 123, reward: challenge.reward, challengeTitle: challenge.title)
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
        .onAppear{
            deleteAllUsers()
            deleteAllCats()
            deleteAllBadges()
            deleteAllChallenges()
            addSampleData()
            print(user.count)
            for challenge in challenges {
                handleValidateChallenge(challenge: challenge)
            }

        }
    }
    
    func handleValidateChallenge(challenge: Challenge){
        if let timeObj = Date().withLocalTime(hour: 10, minute: 0) {
            let foodInfo = FoodInfo(food_id: "", fv_grade: "", g_per_serving: 20, display_name: "egg", nutrition: Nutrition(calories_100g: 50.0))
            challenge.validate(foodInfo: foodInfo, inputTime: timeObj)
            print("Is challenge completed? \(challenge.isCompleted)")
        }
    }
    
    func deleteAllUsers() {
        for user in user {
            modelContext.delete(user)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Error saving context after deletion: \(error.localizedDescription)")
        }
    }
    
    func deleteAllCats() {
        for cat in cat {
            modelContext.delete(cat)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Error saving context after deletion: \(error.localizedDescription)")
        }
    }
    
    func deleteAllBadges() {
        for badge in badges {
            modelContext.delete(badge)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Error saving context after deletion: \(error.localizedDescription)")
        }
    }
    
    func deleteAllChallenges() {
        for c in challenges {
            modelContext.delete(c)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Error saving context after deletion: \(error.localizedDescription)")
        }
    }
    
    func addSampleData(){
        modelContext.insert(Challenge(title: "Drink Milk", reward: 10, foodObj: "milk"))
        if let timeObj = Date().withLocalTime(hour: 10, minute: 0) {
            modelContext.insert(Challenge(title: "Eat Egg Before 10 am", reward: 20, foodObj: "egg", timeObj: timeObj))
            print(timeObj)
        }
        modelContext.insert(Challenge(title: "Eat Apple", reward: 10, foodObj: "apple"))
        
        let badge1 = Badge(image: "Mouse", category: .Toys, price: 10, x: 265, y: 250)
        let badge2 = Badge(image: "Ball", category: .Toys, price: 10, x: 265, y: 250)
        let badge3 = Badge(image: "Stick", category: .Toys, price: 10, x: 265, y: 250)
        let badge4 = Badge(image: "Home", category: .Background, price: 10, x: 100, y: 120)
        let badge5 = Badge(image: "Bed", category: .Background, price: 10, x: 100, y: 120)
        let badge6 = Badge(image: "Aquarium", category: .Background, price: 10, x: 100, y: 120)
        let badge7 = Badge(image: "Can", category: .Foods, price: 10, x: 80, y: 250)
        let badge8 = Badge(image: "Bag", category: .Foods, price: 10, x: 80, y: 250)
        let badge9 = Badge(image: "Milk", category: .Foods, price: 10, x: 80, y: 250)
        
        badge1.isUnlocked = true
        badge2.isUnlocked = true
        badge3.isUnlocked = true
        badge4.isUnlocked = true
        badge5.isUnlocked = true
        badge6.isUnlocked = true
        badge7.isUnlocked = true
        badge8.isUnlocked = true
        badge9.isUnlocked = true
        
        modelContext.insert(badge1)
        modelContext.insert(badge2)
        modelContext.insert(badge3)
        modelContext.insert(badge4)
        modelContext.insert(badge5)
        modelContext.insert(badge6)
        modelContext.insert(badge7)
        modelContext.insert(badge8)
        modelContext.insert(badge9)
        
        let cat = Cat(name: "Hose", image: "cat_fit_normal", weight: 20)
        modelContext.insert(cat)
        
        let user = User(name: "Aaron",
                        targetCalories: 2000,
                        targetCarbohydrates: 225,
                        targetProtein: 65,
                        targetFat: 45,
                        cat: cat
        )
        user.coin = 100
        modelContext.insert(user)
        
        user.dailyNutrition.append(DailyNutrition(date: Date(),
                                                  calories: 1800,
                                                  protein: 60,
                                                  carbohydrates: 200,
                                                  fat: 50)
        )
        user.dailyNutrition.append(DailyNutrition(date:
                                                    Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
                                                  calories: 2200,
                                                  protein: 80,
                                                  carbohydrates: 250,
                                                  fat: 70)
        )
        user.dailyNutrition.append(DailyNutrition(date:
                                                    Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
                                                  calories: 1500,
                                                  protein: 55,
                                                  carbohydrates: 150,
                                                  fat: 45)
        )
    }
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
                    BadgesView()
                }label: {
                    ToolBarIcon(text: "100", image: "dollarsign.circle", color: "green")
                }
            }
            .padding()
            .padding(.vertical, -20)
        }
    }
}

