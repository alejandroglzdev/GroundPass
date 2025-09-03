//
//  SatellitePassView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 24/7/25.
//

import SwiftUI

struct SatellitePassRow: View {
    let imageURL: URL?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Next pass").tint(.gray)
                Text("ISS").fontWeight(.black)
                Text("10:15 AM · 270º · 80º · -1,2").tint(.gray)

            }
            
            Spacer()
            
            RowRoundedAsyncImage(imageURL: imageURL, placeholder: "satellite_pass_placeholder")
        }
    }
}
