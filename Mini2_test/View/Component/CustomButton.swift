//
//  CustomButton.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 22/06/24.
//

import SwiftUI

struct CustomButton: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .frame(width: 260, height: 50)
            .background(Color("CustomOrange"))
            .cornerRadius(15)
            .shadow(radius: 3)
    }
}

#Preview {
    CustomButton(text: "Test")
}
