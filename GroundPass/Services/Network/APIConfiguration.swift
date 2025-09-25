//
//  Configuration.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 26/8/25.
//

import Foundation

enum APIConfiguration {
    static let baseURLN2YO = "https://api.n2yo.com/rest/v1/satellite"
    static let apiKeyN2YO = Bundle.main.infoDictionary?["API_KEY_N2YO"] as? String
    
    static let baseURLGroundPassBackend = "http://localhost:3000"
    
    static let days = 3
    static let minVisibility = 30
}
