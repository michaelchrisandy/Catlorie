//
//  ContentView.swift
//  BintangNewCameraTest
//
//  Created by Bintang Anandhiya on 25/06/24.
//

import SwiftUI
import SwiftData

struct OnboardingView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var fatText = ""
    @State private var carbText = ""
    @State private var protText = ""
    @Query var user: [User]
    
    var body: some View {
        
        
            VStack(alignment: .leading){
                Image("CATLORIES")
                    .resizable()
                    .scaledToFit()
                
                HStack{
                    Spacer()
                    Text("Input your daily nutrition **target!**")
                    Spacer()
                }
                Text("Calories")
                    .padding(.top, 35)
                
                HStack{
                    Text("\((fatText as NSString).floatValue*9 + (carbText as NSString).floatValue*4 + (protText as NSString).floatValue*4)")
                        .font(.system(size: 70,weight: .medium, design: .rounded))
                        .foregroundStyle(.orange)
                    Text("Cals")
                }
                
                Text("Fat")
                TextField("Fat in grams", text: $fatText)
                    .frame(height: 55)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 10)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                    .keyboardType(.numberPad)

                Text("Carbohydrate")
                TextField("Carbs in grams", text: $carbText)
                    .frame(height: 55)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 10)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                    .keyboardType(.numberPad)
                    
                Text("Protein")
                TextField("Protein in grams", text: $protText)
                    .frame(height: 55)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 10)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                    .keyboardType(.numberPad)
                    
                
                Button(action: {
                    var carbtarget: Float = 0
                    var fattarget: Float = 0
                    var prottarget: Float = 0
                    
                    if let c = NumberFormatter().number(from: fatText) {
                        carbtarget = Float(truncating: c)
                    }
                    if let f = NumberFormatter().number(from: carbText) {
                        fattarget = Float(truncating: f)
                    }
                    if let p = NumberFormatter().number(from: protText) {
                        prottarget = Float(truncating: p)
                    }
                    
                    var calories = fattarget*9 + carbtarget*4 + prottarget*4
                    
                    var newUser = User(targetCalories: calories, targetCarbohydrates: carbtarget, targetProtein: prottarget, targetFat: fattarget)
                    
                    newUser.dailyNutrition.append(DailyNutrition(date: Date(),
                                                              calories: 0,
                                                              protein: 0,
                                                              carbohydrates: 0,
                                                              fat: 0)
                    )
                    
                   // newUser.cat.catWeightCategory = newUser.getCatWeightCategory()
                // print("test \(user.cat.catWeightCategory)")
                    
                    
                  //  newUser.cat.updateImage(catWeightCategory: newUser.getCatWeightCategory(), catExpressionCategory: newUser.getCatExpressionCategory())
                    
                    newUser.coin = 100

                    modelContext.insert(newUser)
                    
                    modelContext.insert(Challenge(title: "Drink Milk Today!", reward: 10, foodObj: "milk"))
                    if let timeObj = Date().withLocalTime(hour: 10, minute: 0) {
                        modelContext.insert(Challenge(title: "Eat Egg Before 10 am", reward: 20, foodObj: "egg", timeObj: timeObj))
                        print(timeObj)
                    }
                    modelContext.insert(Challenge(title: "Eat an Apple Today!", reward: 10, foodObj: "apple"))
                    
                    let badge1 = Badge(image: "Mouse", category: .Toys, price: 10, x: 265, y: 250)
                    let badge2 = Badge(image: "Ball", category: .Toys, price: 10, x: 265, y: 250)
                    let badge3 = Badge(image: "Stick", category: .Toys, price: 10, x: 265, y: 250)
                    let badge4 = Badge(image: "Home", category: .Background, price: 10, x: 100, y: 120)
                    let badge5 = Badge(image: "Bed", category: .Background, price: 10, x: 100, y: 120)
                    let badge6 = Badge(image: "Aquarium", category: .Background, price: 10, x: 100, y: 120)
                    let badge7 = Badge(image: "Can", category: .Foods, price: 10, x: 80, y: 250)
                    let badge8 = Badge(image: "Bag", category: .Foods, price: 10, x: 80, y: 250)
                    let badge9 = Badge(image: "Milk", category: .Foods, price: 10, x: 80, y: 250)
                    let badge10 = Badge(image: "Hat", category: .Accessories, price: 10, x: 160, y: 65)
                    let badge11 = Badge(image: "Glasses", category: .Accessories, price: 10, x: 160, y: 110)
                    let badge12 = Badge(image: "Collar", category: .Accessories, price: 10, x: 160, y: 175)
                    
                    modelContext.insert(badge1)
                    modelContext.insert(badge2)
                    modelContext.insert(badge3)
                    modelContext.insert(badge4)
                    modelContext.insert(badge5)
                    modelContext.insert(badge6)
                    modelContext.insert(badge7)
                    modelContext.insert(badge8)
                    modelContext.insert(badge9)
                    modelContext.insert(badge10)
                    modelContext.insert(badge11)
                    modelContext.insert(badge12)
                    
                    newUser.cat.catWeightCategory = newUser.getCatWeightCategory()
                    
                    
                    newUser.cat.updateImage(catWeightCategory: newUser.getCatWeightCategory(), catExpressionCategory: newUser.getCatExpressionCategory())
                    
                }) {
                    Text("Continue")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top)
            }
            .padding()
            .font(.system(size: 20,weight: .regular, design: .rounded))
    }
}

#Preview {
    OnboardingView()
}
