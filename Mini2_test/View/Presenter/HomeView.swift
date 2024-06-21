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
        
        VStack {
            ExtractedView()
            
            HalfCircularProgressView(percentage: $progress)
                .frame(width: 250.0, height: 250.0)
                .padding()
                .padding(.bottom, -100)
            
            Image("cat_fit_normal")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                .offset(x: 20)
            
            HStack(spacing: -20){
                CircularProgressView(percentage: 0.6, category: "A")
                
                CircularProgressView(percentage: 0.8, category: "B")
                
                CircularProgressView(percentage: 0.4, category: "C")
            }
            
            Button{
                
            }label: {
                Text("+ Track Eat")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(width: 260, height: 50)
                    .background(Color("CustomOrange"))
                    .cornerRadius(15)
                    .shadow(radius: 3)
            }
            
            Spacer()
        }
        .padding()
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
        HStack{
            Button{
                
            }label: {
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.black)
            }
            Spacer()
            Text("50 🔥")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: 90, height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black.opacity(0.5), lineWidth: 2)
                )
        }
        .padding()
        .padding(.vertical, -10)
    }
}
