//
//  Configuration.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 26/8/25.
//

import Foundation

enum APIConfiguration {
    static let baseURLN2YO = Bundle.main.infoDictionary?["BASE_URL_N2YO"] as? String ?? ""
    static let apiKeyN2YO = Bundle.main.infoDictionary?["API_KEY_N2YO"] as? String ?? ""
    
    static let baseURLGroundPassBackend = Bundle.main.infoDictionary?["BASE_URL_BACKEND"] as? String ?? ""
    
    static let days = 3
    static let minVisibility = 30
}
