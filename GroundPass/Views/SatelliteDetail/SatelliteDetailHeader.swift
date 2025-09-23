//
//  SatelliteDetailHeader.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 23/9/25.
//

import SwiftUI

struct SatelliteDetailHeader: View {
    let satelliteName: String
    let noradID: String
    let country: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderText(text: satelliteName)
            
            let subtitle = L10n.SatelliteDetail.SatelliteDetailHeader.subtitle
            let subtitleFormatted = String(format: subtitle, noradID, country)
            Text(subtitleFormatted)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    SatelliteDetailHeader(satelliteName: "ISS", noradID: "25444", country: "USA")
}
