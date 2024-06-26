//
//  CustomAlertView.swift
//  Mini2_test
//
//  Created by Jonathan Aaron Wibawa on 25/06/24.
//

import SwiftUI

struct CustomAlertView: View {
    let title: String
    let message: String
    let buttonText: String
    let onDismiss: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.headline)
                .padding(.top)

            Text(message)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button(action: onDismiss) {
                Text(buttonText)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(.horizontal, 40)
    }
}



