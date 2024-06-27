//
//  ToolBarIcon.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 21/06/24.
//

import SwiftUI


struct ToolBarIcon: View {
    
    var text: String
    var image: String
    var color: String
    
    var body: some View {
        HStack{
            Image(systemName: image)
                .foregroundStyle(color == "red" ? .red : .green)
            Text(text)
            
            Image(systemName: "chevron.right")
                .opacity(0.3)
//                .padding(.trailing, -10)
        }
        .foregroundStyle(.black)
        .font(.title3)
        .fontWeight(.light)
        .frame(width: 90, height: 40)
        .padding(.horizontal, 5)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("CustomOrange"))
//                .stroke(Color.black.opacity(0.4), lineWidth: 1)
//                .shadow(color: .black, radius: 2, x: 2, y: 2)
                .opacity(0.5)
        )
        
        
        
    }
}

#Preview {
    ToolBarIcon(text: "10", image: "flame", color: "red")
}
