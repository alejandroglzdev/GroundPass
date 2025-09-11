//
//  VisualPassDetailViewModel.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 10/9/25.
//

import SwiftUI

final class VisualPassDetailViewModel: ObservableObject {
    @Published var pass: VisualPass
    
    private let locationService = LocationService()
    
    init(pass: VisualPass) {
        self.pass = pass
    }
    
    func getSolarElevation() {
        locationService.requestLocation { lat, lon, alt in
            let solarElevation = AstronomicCalculation.solarElevation(date: Date.now, latitude: lat, longitude: lon)
        }
    }
}
