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
    @Published var model3DURL: URL?
    @Published var model3DState: Model3DState = .loading
    
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
            try? await fetchSatellite3dModel(modelUrl: satellite?.modelUrl ?? "")
        case .failure(_):
            self.satellite = nil
        }
    }
    
    func fetchSatellite3dModel(modelUrl: String) async throws {
        let result = await backendService.satelliteModel3D(modelUrl: modelUrl)
        
        switch result {
        case .success(let model3D):
            let localURL = try CacheManagement.save(data: model3D, key: modelUrl)
            self.model3DURL = localURL
            self.model3DState = .loaded(localURL)
        case .failure:
            self.model3DState = .error
        }
    }
}
