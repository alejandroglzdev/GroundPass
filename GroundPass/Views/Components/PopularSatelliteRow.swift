//
//  PopularSatelliteRow.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 19/9/25.
//

import SwiftUI

struct PopularSatelliteRow: View {
    let satelliteName: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image("satellite_icon")
            Text(satelliteName)
            Spacer()
        }
        .padding(.horizontal, 16)
        .frame(minWidth: 0, idealWidth: 185, maxWidth: .infinity, minHeight: 50, idealHeight: 60, maxHeight: 80)
        .background(Color(UIColor.backgroundSecondary))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    PopularSatelliteRow(satelliteName: "ISS")
}
