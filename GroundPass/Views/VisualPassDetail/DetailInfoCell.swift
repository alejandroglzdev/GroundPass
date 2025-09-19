//
//  DetailInfoCell.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 9/9/25.
//

import SwiftUI

struct DetailInfoCell: View {
    let title: String
    let text: String
    
    var body: some View {
        Divider().background(Color.backgroundContrasting)
        
        Text(title)
            .font(.headline)
        
        Text(text)
            .font(.subheadline)
    }
}

#Preview {
    DetailInfoCell(title: "Start", text: "2024-03-22 21:45:00 UTC")
}
