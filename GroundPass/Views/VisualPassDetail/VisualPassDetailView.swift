//
//  VisualPassDetailView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 8/9/25.
//

import SwiftUI

public struct VisualPassDetailView: View {
    @EnvironmentObject var router: NavigationRouter

    public var body: some View {
        VStack(alignment: .trailing) {
            ScrollView {
                Image("satellite_detail_placeholder")
                    .resizable()
                    .scaledToFit()
                
                DateTimeInfo(start: "2024-03-22 21:45:00 UTC", end: "2024-03-22 21:45:00 UTC").padding(24)
                DirectionElevationInfo(startAzCompass: "NW", endAzCompass: "SE", maxEl: "45", maxAzCompass: "S", maxUTC: "9:35 PM").padding(24)
                DurationInfo(duration: "4 min 0 sec").padding(24)
                VisibilityInfo(magnitude: 4.1, isVisible: true).padding(24)
                SatelliteDetailInfo(name: "ISS (ZARYA)", noradId: "25544").padding(24)

            }
            
            RoundedButton(action: {}, text: L10n.VisualPassDetail.button).padding(18)
        }
        .navigationTitle(L10n.VisualPassDetail.topBarTitle)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    router.pop()
                }) {
                    Image(systemName: "chevron.left")
                        .tint(Color.backgroundContrasting)
                }
            }
        }
        .background(Color.background)
    }
}

#Preview {
    VisualPassDetailView()
}
