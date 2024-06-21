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
    @State private var progress = 0.5
    
    var body: some View {
        
        VStack {
            ExtractedView()
            
            ProgressView(value: progress) {
                HStack {
                    Spacer()
                    Text("1000 / 2000 Cals")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.bottom, 15)
                    Spacer()
                }
            }
            .progressViewStyle(LinearProgressViewStyle(tint: .yellow))
            .padding()
            
            
            ZStack {
                Image("Ellipse")
                    .resizable()
                    .frame(width: 350, height: 350)
                Image("catpic")
                    .offset(y: 80)
                
                CircularProgressView(percentage: 0.6, category: "A")
                    .frame(width: 70)
                    .offset(x: -140, y: -120)
                
                CircularProgressView(percentage: 0.8, category: "B")
                    .frame(width: 70)
                    .offset(y: -180)
                
                CircularProgressView(percentage: 0.4, category: "C")
                    .frame(width: 70)
                    .offset(x: 140, y: -120)
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .onAppear{
            deleteAllUsers()
            addSampleData()
            print(user[0].cat.badges[0].name, user[0].cat.badges[0].desc)
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
    
    func addSampleData(){
        let cat = Cat(name: "Hose", image: "catpic", weight: 20)
        modelContext.insert(cat)
        
        cat.badges.append(Badge(name: "Blue Hat", desc: "2 day streak", image: "hatpic", category: BadgeCategory.hat))
        cat.badges.append(Badge(name: "Red Hat", desc: "3 day streak", image: "cap", category: BadgeCategory.hat))
        cat.badges.append(Badge(name: "Green Hat", desc: "4 day streak", image: "hat", category: BadgeCategory.hat))
        cat.badges.append(Badge(name: "Green Hat", desc: "5 day streak", image: "party-hat", category: BadgeCategory.hat))
        
        let user = User(name: "Aaron",
                        targetCalories: 2000,
                        targetCarbohydrates: 225,
                        targetProtein: 65,
                        targetFat: 45,
                        cat: cat
        )
        
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
    }
}
