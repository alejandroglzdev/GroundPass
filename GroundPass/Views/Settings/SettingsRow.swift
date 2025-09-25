//
//  SettingsRow.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 23/9/25.
//

import SwiftUI

struct SettingsRow: View {
    let text: String
    let onTap: () -> Void
    
    var body: some View {
        Button(action: {
            onTap()
        }) {
            HStack {
                Text(text)
                    .tint(.backgroundContrasting)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.title2)
                    .foregroundColor(.backgroundContrasting)
            }
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    SettingsRow(text: "Manage your favourite satellites", onTap: {})
}
