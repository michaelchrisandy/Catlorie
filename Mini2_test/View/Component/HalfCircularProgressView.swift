import SwiftUI

struct HalfCircularProgressView: View {
    
    var target: Float
    var currentCalories: Float

    var body: some View {
        let percentage = currentCalories / target
        let margin = target * 0.2
        let adjustedTarget = target + margin
        let clampedPercentage = min(percentage, 1.0)
        let progressColor = currentCalories > adjustedTarget ? Color.red : Color("CustomOrange")
        
        let numberFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .none
            return formatter
        }()
        
        let formattedCurrentCalories = numberFormatter.string(from: NSNumber(value: Int(currentCalories))) ?? "0"
        let formattedTarget = numberFormatter.string(from: NSNumber(value: Int(target))) ?? "0"
        
        ZStack {
            Circle()
                .trim(from: 0.35, to: 0.85)
                .stroke(style: StrokeStyle(lineWidth: 18.0, lineCap: .round, lineJoin: .round))
                .opacity(0.3)
                .foregroundStyle(Color("CustomOrange"))
                .rotationEffect(.degrees(54.5))
            
            Circle()
                .trim(from: 0.35, to: 0.35 + (0.5 * CGFloat(clampedPercentage)))
                .stroke(style: StrokeStyle(lineWidth: 18.0, lineCap: .round, lineJoin: .round))
                .fill(progressColor)
                .rotationEffect(.degrees(54.5))
            
            VStack {
                Text(formattedCurrentCalories)
                    .font(Font.system(size: 44))
                    .tracking(2)
                    .fontWeight(.heavy)
                Text("of \(formattedTarget) calories")
                    .fontWeight(.bold)
                    .opacity(0.25)
            }
            .padding(.top, -70)
        }
    }
}

#Preview {
    HalfCircularProgressView(target: 2000, currentCalories: 2410)
}
