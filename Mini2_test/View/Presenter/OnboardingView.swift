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
    @State private var test1 = ""
    @State private var test2 = ""
    @State private var test3 = ""
    @Query var user: [User]
    
    var body: some View {
        if(!user.isEmpty){
            VStack{
                
            }
            .task{
                print("SKIP THIS VIEW")
            }
            
        }
        
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
                TextField("Fat in grams", text: $test1)
                    .frame(height: 55)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 10)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))

                Text("Carbohydrate")
                TextField("Carbs in grams", text: $test2)
                    .frame(height: 55)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 10)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                    
                Text("Protein")
                TextField("Protein in grams", text: $test3)
                    .frame(height: 55)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 10)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                    
                
                Button(action: {
                    var carbtarget: Float = 0
                    var fattarget: Float = 0
                    var prottarget: Float = 0
                    
                    if let c = NumberFormatter().number(from: test1) {
                        carbtarget = Float(truncating: c)
                    }
                    if let f = NumberFormatter().number(from: test2) {
                        fattarget = Float(truncating: f)
                    }
                    if let p = NumberFormatter().number(from: test3) {
                        prottarget = Float(truncating: p)
                    }
                    
                    var calories = fattarget*9 + carbtarget*4 + prottarget*4
                    
                    var user = User(targetCalories: calories, targetCarbohydrates: carbtarget, targetProtein: prottarget, targetFat: fattarget)
//                    
                    modelContext.insert(user)
                    print("pressed")
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
