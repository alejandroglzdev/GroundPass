//
//  Sat.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 14/1/26.
//

import SwiftUI

enum Model3DState: Equatable {
    case loading
    case loaded(URL)
    case error
}

struct SatelliteModel3DSection: View {
    let state: Model3DState
    let noradID: String
    
    var body: some View {
        Group {
            switch state {
            case .loading:
                ProgressView()
                    .frame(height: 250)
                
            case .error:
                Image("satellite_detail_placeholder")
                    .resizable()
                    .scaledToFit()
                
            case .loaded(let url):
                Model3DView(localURL: url, key: noradID)
                    .frame(height: 250)
                    .onDisappear {
                        CacheManagement.clear(key: noradID)
                    }
            }
        }
    }
}
