//
//  ManageFavouriteSatelliteRow.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 24/9/25.
//

import SwiftUI

struct ManageFavouriteSatelliteRow: View {
    let satelliteName: String
    let noradId: String
    let onDelete: () -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "sparkles")
                .padding(8)
                .background(Color(UIColor.backgroundSecondary))
            VStack(alignment: .leading) {
                Text(satelliteName)
                Text(noradId)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button(action: {
                onDelete()
            }) {
                Image(systemName: "trash")
                    .frame(width: 32, height: 32)
                    .padding(.vertical, 8)
                    .tint(.backgroundContrasting)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    ManageFavouriteSatelliteRow(satelliteName: "International Space Stations", noradId: "25544", onDelete: {})
}
