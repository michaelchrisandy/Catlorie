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
        }
        .foregroundStyle(.black)
        .font(.title3)
        .fontWeight(.light)
        .frame(width: 90, height: 40)
        .padding(.horizontal, 5)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black.opacity(0.4), lineWidth: 1)
        )
    }
}

#Preview {
    ToolBarIcon(text: "10", image: "flame", color: "red")
}
