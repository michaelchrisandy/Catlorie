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
                    Text("\(390.0, specifier: "%.1f")")
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
                    
                    var newUser = User(targetCalories: calories, targetCarbohydrates: carbtarget, targetProtein: prottarget, targetFat: fattarget, cat: Cat(name: "asd", image: "asd", weight: 20))
//
                    modelContext.insert(newUser)
                    print("pressed")
                    print(user)
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
