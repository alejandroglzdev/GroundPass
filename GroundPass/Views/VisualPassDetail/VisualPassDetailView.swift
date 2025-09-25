//
//  VisualPassDetailView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 8/9/25.
//

import SwiftUI

public struct VisualPassDetailView: View {
    @StateObject private var viewModel: VisualPassDetailViewModel
    @EnvironmentObject var router: NavigationRouter
    
    init(pass: VisualPass) {
        _viewModel = StateObject(wrappedValue: VisualPassDetailViewModel(pass: pass))
    }

    public var body: some View {
        VStack(alignment: .trailing) {
            if let isVisible = viewModel.isVisible {
                ScrollView {
                    Image("satellite_detail_placeholder")
                        .resizable()
                        .scaledToFit()
                    
                    let start = viewModel.pass.startUTC.formattedAsUTCDateTime()
                    let end = viewModel.pass.endUTC.formattedAsUTCDateTime()
                    DateTimeInfo(start: start, end: end).padding(24)
                    
                    let startAzCompass = viewModel.pass.startAzCompass
                    let endAzCompass = viewModel.pass.endAzCompass
                    let maxEl = String(viewModel.pass.maxEl)
                    let maxAzCompass = viewModel.pass.maxAzCompass
                    let maxUTC = viewModel.pass.maxUTC.formattedAs12HourTime()
                    DirectionElevationInfo(startAzCompass: startAzCompass, endAzCompass: endAzCompass, maxEl: maxEl, maxAzCompass: maxAzCompass, maxUTC: maxUTC).padding(24)
                    
                    let duration = viewModel.pass.duration.formattedAsMinutesAndSeconds()
                    DurationInfo(duration: duration).padding(24)
                    
                    let magnitude = viewModel.pass.mag
                    VisibilityInfo(magnitude: magnitude, satelliteVisibility: isVisible).padding(24)
                    
                    let satelliteName = viewModel.pass.satelliteName
                    let noradId = String(viewModel.pass.noradId)
                    SatelliteDetailInfo(name: satelliteName, noradId: noradId).padding(24)
                    
                }
            } else {
                ProgressView().padding(24)
            }
            
            RoundedButton(text: L10n.VisualPassDetail.button, action: { }).padding(18)
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

}
