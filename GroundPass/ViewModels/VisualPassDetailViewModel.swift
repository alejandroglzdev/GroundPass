//
//  VisualPassDetailViewModel.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 10/9/25.
//

import SwiftUI

@MainActor
final class VisualPassDetailViewModel: ObservableObject {
    @Published var pass: VisualPass
    @Published var isVisible: SatelliteVisibility? = nil
    
    private let locationService = LocationService()
    
    init(pass: VisualPass) {
        self.pass = pass
        
        Task {
            await calculateVisibility()
        }
    }
    
    func getSolarElevation(latitude: Double, longitude: Double) -> Double {
        return AstronomicCalculation.solarElevation(date: Date.now, latitude: latitude, longitude: longitude)
    }
    
    func calculateVisibility() async {
        do {
            let location = try await locationService.requestLocation()
            self.isVisible = await pass.satelliteIsVisible(latitude: location.latitude, longitude: location.longitude)
        } catch {
            self.isVisible = .notVisible
        }
    }
}
