//
//  HalfCircularProgressView.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 21/06/24.
//

import SwiftUI

struct HalfCircularProgressView: View {
    @Binding var percentage: Float
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.35, to: 0.85)
                .stroke(style: StrokeStyle(lineWidth: 18.0, lineCap: .round, lineJoin: .round))
                .opacity(0.3)
                .foregroundColor(Color.gray)
                .rotationEffect(.degrees(54.5))
            
            Circle()
                .trim(from: 0.35, to: 0.35+(0.5*(CGFloat(percentage))))
                .stroke(style: StrokeStyle(lineWidth: 18.0, lineCap: .round, lineJoin: .round))
                .fill(Color("CustomOrange"))
                .rotationEffect(.degrees(54.5))
            
            VStack{
                Text("1000")
                    .font(Font.system(size: 44))
                    .fontWeight(.heavy)
                Text("of 2000 calories")
                    .fontWeight(.ultraLight)
            }
            .padding(.top, -70)
        }
    }
}

