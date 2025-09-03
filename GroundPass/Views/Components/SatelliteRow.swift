//
//  SatelliteRow.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 21/7/25.
//

import SwiftUI

struct SatelliteRow: View {
    let item: Satellite
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.subtitle ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            RowRoundedAsyncImage(imageURL: item.imageURL, placeholder: "globe.europe.africa.fill")
        }
        
    }
}

#Preview {
    let famousSatellite = FamousSatellites.all[0]
    SatelliteRow(item: famousSatellite)
}
