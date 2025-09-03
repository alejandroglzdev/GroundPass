//
//  RoundedButton.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 23/7/25.
//

import SwiftUI

struct RoundedButton: View {
    let action: () -> Void
    let text: String
    var isEnabled: Bool = true
    var maxWidth: CGFloat? = nil
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .padding()
                .frame(maxWidth: maxWidth)
                .background(isEnabled ? Color.button : Color.buttonDisabled)
                .foregroundColor(isEnabled ? Color.buttonText : Color.buttonTextDisabled)
                .cornerRadius(30)
                .fontWeight(.bold)
        }
        .disabled(!isEnabled)
    }
}
