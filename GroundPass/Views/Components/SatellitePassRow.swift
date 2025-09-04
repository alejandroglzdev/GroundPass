//
//  SatellitePassView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 24/7/25.
//

import SwiftUI

struct SatellitePassRow: View {
    let imageURL: URL?
    let visualPass: VisualPass
    
    var body: some View {
        let satelliteName = visualPass.satelliteName
        let detail = "\(visualPass.startUTC.formatToWeekdayDay12HourClock()), · \(visualPass.startAzCompass) to \(visualPass.endAzCompass) · \(visualPass.maxEl)"
        
        HStack {
            VStack(alignment: .leading) {
                Text("Next pass").tint(.gray)
                Text(satelliteName).fontWeight(.black)
                Text(detail).tint(.gray)
            }
            
            Spacer()
            
            RowRoundedAsyncImage(imageURL: imageURL, placeholder: "satellite_pass_placeholder")
        }
    }
}
