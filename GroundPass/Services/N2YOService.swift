//
//  HomeService.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 26/8/25.
//

import Combine

//@MainActor
final class N2YOService: ObservableObject {
    private let networkService = NetworkService()
    
    func getVisualPasses(noradId: Int, latitude: Double, longitude: Double, altitude: Double, days: Int, minVisbility: Int) async -> Result<[VisualPass], APIError> {
        let request = N2YOEndpoint.passes(noradId: noradId, latitude: latitude, longitude: longitude, altitude: altitude, days: days, minVisibility: minVisbility)
        let dataResult = await networkService.request(with: request)
        
        switch dataResult {
        case .success(let data):
            return .success(N2YOParser.parse(response: data))
        case .failure(let error):
            return .failure(error)
        }
        
    }
}
