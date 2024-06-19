//
//  ContentView.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 13/06/24.
//

import SwiftUI

struct HomeView: View {
    
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
    }
}

#Preview {
    HomeView()
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
