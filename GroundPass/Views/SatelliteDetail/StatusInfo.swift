//
//  StatusInfo.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 23/9/25.
//

import SwiftUI

struct StatusInfo: View {
    let status: String
    let typePurpose: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderText(text: L10n.SatelliteDetail.StatusInfo.title)

            HStack(spacing: 25) {
                VStack(alignment: .leading) {
                    DetailInfoCell(title: L10n.SatelliteDetail.StatusInfo.statusTitle, text: status)
                }
                VStack(alignment: .leading) {
                    DetailInfoCell(title: L10n.SatelliteDetail.StatusInfo.typePurposeTitle, text: typePurpose)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    StatusInfo(status: "Active", typePurpose: "Rocket")
}
