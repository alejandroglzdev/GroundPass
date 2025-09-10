//
//  DateTimeInfo.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 8/9/25.
//

import SwiftUI

struct VisibilityInfo: View {
    let magnitude: Double
    let isVisible: Bool
    
    private var formattedMagnitude: String {
        String(format: "%.1f", magnitude)
    }
    
    private var visibilityText: String {
        isVisible ? L10n.VisualPassDetail.VisibilityInfo.visibilityYes : L10n.VisualPassDetail.VisibilityInfo.visibilityNo
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderText(text: L10n.VisualPassDetail.VisibilityInfo.title)
            
            HStack(spacing: 25) {
                VStack (alignment: .leading) {
                    DetailInfoCell(title: L10n.VisualPassDetail.VisibilityInfo.magnitudeTitle, text: formattedMagnitude)
                }
                
                VStack (alignment: .leading) {
                    DetailInfoCell(title: L10n.VisualPassDetail.VisibilityInfo.visibilityTitle, text: visibilityText)
                }
                
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    VisibilityInfo(magnitude: 4.1, isVisible: true)
}
