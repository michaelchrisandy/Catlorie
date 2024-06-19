import SwiftUI

struct NutritionTargetTextView: View {
    @State private var calories: String = "2500"
    @State private var carbohydrates: String = "460"
    @State private var protein: String = "220"
    @State private var fat: String = "60"
    
    var body: some View {
        VStack {
            Text("CATLORIES")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .tracking(2)
                .padding(2)
            Text("Input your daily nutrition target!")
                .padding(.bottom, 20)
                
            VStack(spacing: 50) {
                CustomTextField(title: "Calories", type: "Cals", text: $calories)
                CustomTextField(title: "Carbohydrates", type: "Grams", text: $carbohydrates)
                CustomTextField(title: "Protein", type: "Grams", text: $protein)
                CustomTextField(title: "Fat", type: "Grams", text: $fat)
            }
            .padding()
        }
    }
}

#Preview {
    NutritionTargetTextView()
}

struct CustomTextField: View {
    var title: String
    var type: String
    
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
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
            
            TextField("Enter \(title.lowercased())", text: $text)
                .keyboardType(.numberPad)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
        }
    }
}


