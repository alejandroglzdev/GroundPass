//
//  LaunchInfo.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 23/9/25.
//

import SwiftUI

struct LaunchInfo: View {
    let launchDate: String
    let launchLocation: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderText(text: L10n.SatelliteDetail.LaunchInfo.title)

            HStack(spacing: 25) {
                VStack(alignment: .leading) {
                    DetailInfoCell(title: L10n.SatelliteDetail.LaunchInfo.dateTitle, text: launchDate)
                }
                VStack(alignment: .leading) {
                    DetailInfoCell(title: L10n.SatelliteDetail.LaunchInfo.locationTitle, text: launchLocation)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    LaunchInfo(launchDate: "2023-12-01", launchLocation: "Cope Canaveral")
}
