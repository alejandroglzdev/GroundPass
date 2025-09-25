//
//  RoundedButton.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 23/7/25.
//

import SwiftUI

enum ButtonPurpose {
    case standard
    case delete
    
    var buttonColor: Color {
        switch self {
        case .delete: return .red
        case .standard: return Color.button
        }
    }
    
    var disabledButtonColor: Color {
        switch self {
        case .delete: return .red
        case .standard: return Color.buttonDisabled
        }
    }
}

struct RoundedButton: View {
    let action: () -> Void
    let text: String
    var buttonPurpose: ButtonPurpose = .standard
    var isEnabled: Bool = true
    var maxWidth: CGFloat? = nil
    
    init(
        text: String,
        buttonPurpose: ButtonPurpose = .standard,
        isEnabled: Bool = true,
        maxWidth: CGFloat? = nil,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.buttonPurpose = buttonPurpose
        self.isEnabled = isEnabled
        self.maxWidth = maxWidth
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .padding()
                .frame(maxWidth: maxWidth)
                .background(isEnabled ? buttonPurpose.buttonColor : buttonPurpose.disabledButtonColor)
                .foregroundColor(isEnabled ? Color.buttonText : Color.buttonTextDisabled)
                .cornerRadius(30)
                .fontWeight(.bold)
        }
        .disabled(!isEnabled)
    }
}
