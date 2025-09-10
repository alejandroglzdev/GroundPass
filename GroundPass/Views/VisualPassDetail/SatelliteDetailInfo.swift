//
//  DateTimeInfo.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 8/9/25.
//

import SwiftUI

struct SatelliteDetailInfo: View {
    let name: String
    let noradId: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderText(text: L10n.VisualPassDetail.SatelliteDetailInfo.title)
            
            HStack(spacing: 25) {
                VStack (alignment: .leading) {
                    DetailInfoCell(title: L10n.VisualPassDetail.SatelliteDetailInfo.nameTitle, text: name)
                }
                
                VStack (alignment: .leading) {
                    DetailInfoCell(title: L10n.VisualPassDetail.SatelliteDetailInfo.noradIdTitle, text: noradId)
                }
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    SatelliteDetailInfo(name: "ISS (ZARYA)", noradId: "25544")
}
