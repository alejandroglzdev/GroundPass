//
//  GroundPassBackendService.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 23/9/25.
//

import Combine

@MainActor
final class GroundPassBackendService: ObservableObject {
    private let networkService = NetworkService()
    
    func satelliteSearch(satelliteName: String) async -> Result<[Satellite], APIError> {
        let request = GroundPassBackendEndpoint.satelliteSearch(satelliteName: satelliteName)
        let dataResult = await networkService.request(with: request)
        
        switch dataResult {
        case .success(let data):
            return .success(GroundPassBackendParser.parseSearch(response: data))
        case .failure(let error):
            return .failure(error)
        }
        
    }
}
