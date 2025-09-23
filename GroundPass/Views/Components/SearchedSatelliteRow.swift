//
//  PopularSatelliteRow.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 19/9/25.
//

import SwiftUI

struct SearchedSatelliteRow: View {
    let satelliteName: String
    let noradId: Int
    
    var body: some View {
        HStack(spacing: 20) {
            Image("satellite_icon")
            VStack(alignment: .leading) {
                Text(satelliteName).lineLimit(1)
                Text(String(noradId))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal, 16)
        .frame(minWidth: 0, idealWidth: 185, maxWidth: .infinity, minHeight: 50, idealHeight: 60, maxHeight: 80)
        .background(Color(UIColor.backgroundSecondary))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
