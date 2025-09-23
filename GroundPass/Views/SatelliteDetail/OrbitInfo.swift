//
//  OrbitInfo.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 23/9/25.
//

import SwiftUI

struct OrbitInfo: View {
    let apogee: String
    let perigee: String
    let inclination: String
    let period: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderText(text: L10n.SatelliteDetail.OrbitInfo.title)
            
            HStack(spacing: 25) {
                VStack(alignment: .leading) {
                    let text =  L10n.SatelliteDetail.OrbitInfo.apogeeText
                    let textFormatted = String(format: text, apogee)
                    DetailInfoCell(title: L10n.SatelliteDetail.OrbitInfo.apogeeTitle, text: textFormatted)
                }
                
                VStack(alignment: .leading) {
                    let text =  L10n.SatelliteDetail.OrbitInfo.perigeeText
                    let textFormatted = String(format: text, perigee)
                    DetailInfoCell(title: L10n.SatelliteDetail.OrbitInfo.perigeeTitle, text: textFormatted)
                }
            }
            
            HStack(spacing: 25) {
                VStack(alignment: .leading) {
                    let text =  L10n.SatelliteDetail.OrbitInfo.inclinationText
                    let textFormatted = String(format: text, inclination)
                    DetailInfoCell(title: L10n.SatelliteDetail.OrbitInfo.inclinationTitle, text: textFormatted)
                }
                
                VStack(alignment: .leading) {
                    let text =  L10n.SatelliteDetail.OrbitInfo.periodText
                    let textFormatted = String(format: text, period)
                    DetailInfoCell(title: L10n.SatelliteDetail.OrbitInfo.periodTitle, text: textFormatted)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
