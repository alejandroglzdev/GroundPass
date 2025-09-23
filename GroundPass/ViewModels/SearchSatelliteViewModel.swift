//
//  SearchSatelliteViewModel.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 22/9/25.
//

import Foundation
import SwiftUI

@MainActor
final class SearchSatelliteViewModel: ObservableObject {
    @Published var searchedSatellites: [Satellite]?
    
    private let backendService = GroundPassBackendService()
    
    func searchSatellite(with name: String) async {
        let result = await backendService.satelliteSearch(satelliteName: name)
        
        switch result {
        case .success(let satellites):
            searchedSatellites = satellites
        case .failure(_):
            searchedSatellites = []
        }
    }
}
