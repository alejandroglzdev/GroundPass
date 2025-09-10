//
//  DateTimeInfo.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 8/9/25.
//

import SwiftUI

struct DateTimeInfo: View {
    let start: String
    let end: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderText(text: L10n.VisualPassDetail.DateTimeInfo.title)
            
            HStack(spacing: 25) {
                VStack (alignment: .leading) {
                    DetailInfoCell(title: L10n.VisualPassDetail.DateTimeInfo.startTitle, text: start)
                }
                
                VStack (alignment: .leading) {
                    DetailInfoCell(title: L10n.VisualPassDetail.DateTimeInfo.endTitle, text: end)
                }
                
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    DateTimeInfo(start: "2024-03-22 21:45:00 UTC", end: "2024-03-22 21:45:00 UTC")
}
