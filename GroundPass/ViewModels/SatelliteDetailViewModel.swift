//
//  SatelliteDetailViewModel.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 23/9/25.
//

import Foundation

@MainActor
final class SatelliteDetailViewModel: ObservableObject {
    @Published var satellite: Satellite?
    
    private let backendService = GroundPassBackendService()

    
    init(noradId: Int) {
        Task {
            await fetchSatelliteInfo(noradId: noradId)
        }
    }
    
    private func fetchSatelliteInfo(noradId: Int) async {
        let result = await backendService.satelliteInfo(noradId: noradId)
        
        switch result {
        case .success(let satellite):
            self.satellite = satellite
        case .failure(_):
            self.satellite = nil
        }
    }
}
