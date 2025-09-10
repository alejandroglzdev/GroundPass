//
//  DateTimeInfo.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 8/9/25.
//

import SwiftUI

struct DirectionElevationInfo: View {
    let startAzCompass: String
    let endAzCompass: String
    let maxEl: String
    let maxAzCompass: String
    let maxUTC: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderText(text: L10n.VisualPassDetail.DirectionElevationInfo.title)
            
            HStack(spacing: 25) {
                VStack (alignment: .leading) {
                    let title = L10n.VisualPassDetail.DirectionElevationInfo.directionTitle
                    let text =  L10n.VisualPassDetail.DirectionElevationInfo.directionText
                    let textFormatted = String(format: text, startAzCompass, endAzCompass)
                    DetailInfoCell(title: title, text: textFormatted)
                }
                
                VStack (alignment: .leading) {
                    let title = L10n.VisualPassDetail.DirectionElevationInfo.maxElevationTitle
                    let text =  L10n.VisualPassDetail.DirectionElevationInfo.maxElevationText
                    let textFormatted = String(format: text, maxEl, maxAzCompass, maxUTC)
                    DetailInfoCell(title: title, text: textFormatted)
                }
                
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    DirectionElevationInfo(startAzCompass: "NW", endAzCompass: "SE", maxEl: "45", maxAzCompass: "S", maxUTC: "9:35 PM")
}
