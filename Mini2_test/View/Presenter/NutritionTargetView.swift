//
//  NutritionTargetView.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 18/06/24.
//

import SwiftUI

struct NutritionTargetView: View {
    @State private var calories: Float = 2500.0
    @State private var carbohydrates: Float = 460.0
    @State private var protein: Float = 220.0
    @State private var fat: Float = 60.0
    @State private var isEditing = false
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text("CATLORIES")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .tracking(2)
                    .padding(2)
                Text("Input your daily nutrition target!")
                    .padding(.bottom, 20)
                
                VStack(spacing: 50) {
                    CustomSlider(title: "Calories", type: "Cals", min: 1000, max: 4000, calories: $calories, isEditing: $isEditing)
                    CustomSlider(title: "Carbohydrates", type: "Grams", min: 50, max: 600, calories: $carbohydrates, isEditing: $isEditing)
                    CustomSlider(title: "Protein", type: "Grams", min: 30, max: 250, calories: $protein, isEditing: $isEditing)
                    CustomSlider(title: "Fat", type: "Grams", min: 20, max: 150, calories: $fat, isEditing: $isEditing)
                }
                .padding()
            }
        }
        
    }
}

#Preview {
    NutritionTargetView()
}

struct CustomSlider: View {
    
    var title: String
    var type: String
    var min, max: Float
    
    @Binding var calories: Float
    @Binding var isEditing: Bool
    
    var body: some View {
        VStack{
            HStack{
                Text("\(title)")
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("(in \(type))")
                    .fontWeight(.semibold)
                    .font(.title3)
                    .opacity(0.3)
                Spacer()
            }
            .padding(.bottom, 5)
            
            //ini masi redundant
            Text("\(String(format: "%.0f", calories))")
            
            Slider(
                value: $calories,
                in: min...max,
                step: 5
            ) {
                Text("Speed")
            } minimumValueLabel: {
                Text("")
            } maximumValueLabel: {
                Text("")
            } onEditingChanged: { editing in
                isEditing = editing
            }
            .tint(Color("CustomOrange"))
            
            HStack{
                Text("\(String(format: "%.0f", min))")
                Spacer()
                Text("\(String(format: "%.0f", max))")
            }
            .padding(.horizontal, 10)
            .padding(.vertical, -2)
        }
    }
}
