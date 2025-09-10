//
//  DateTimeInfo.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 8/9/25.
//

import SwiftUI

struct DurationInfo: View {
    let duration: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderText(text: L10n.VisualPassDetail.DurationInfo.title)
            
            HStack(spacing: 25) {
                VStack (alignment: .leading) {
                    DetailInfoCell(title: L10n.VisualPassDetail.DurationInfo.durationTitle, text: duration)
                }
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    DurationInfo(duration: "4 min 0 sec")
}
