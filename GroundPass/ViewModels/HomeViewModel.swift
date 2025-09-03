//
//  HomeViewModel.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 26/8/25.
//

import Combine
import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var passes: [VisualPass] = []
    
    private let n2yoService = N2YOService()
    private let locationService = LocationService()
    
    private var latitude: Double?
    private var longitude: Double?
    private var altitude: Double?
    
    func fetchFavouritesSatellitesVisualPasses(favouriteSatellites: [FavouriteSatellite]) {
        locationService.requestLocation { lat, lon, alt in
            self.latitude = lat
            self.longitude = lon
            self.altitude = alt
            
            Task {
                for satellite in favouriteSatellites {
                    await self.fetchVisualPasses(with: satellite.noradId)
                }
            }
        }
    }
    
    private func fetchVisualPasses(with noradId: Int) async {
        guard let latitude = latitude,
              let longitude = longitude,
              let altitude = altitude else { return }
        
        let result = await n2yoService.getVisualPasses(noradId: noradId, latitude: latitude, longitude: longitude, altitude: altitude, days: APIConfiguration.days, minVisbility: APIConfiguration.minVisibility)
        
        switch result {
        case .success(let passes):
            self.passes.append(contentsOf: passes)
        case .failure(_):
            break
        }
            
    }
}
