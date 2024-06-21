//
//  CircularProgressView.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 18/06/24.
//

import SwiftUI

struct CircularProgressView: View {
    
    var percentage: Double
    var category: String
    
    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(.white)
                Circle()
                    .stroke(
                        style: StrokeStyle(lineWidth: 10, lineCap: .round)
                    )
                    .foregroundStyle(Color("CustomOrange").opacity(0.3))
                    .frame(width: 60)
                Circle()
                    .trim(from: 0.0, to: percentage)
                    .stroke(
                        style: StrokeStyle(lineWidth: 10, lineCap: .round)
                    )
                    .foregroundStyle(Color("CustomOrange"))
                    .frame(width: 60)
            }
        }
    }
}

#Preview {
    CircularProgressView(percentage: 50, category: "test")
}
