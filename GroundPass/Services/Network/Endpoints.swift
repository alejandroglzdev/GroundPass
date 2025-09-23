//
//  N2YOEndpoints.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 26/8/25.
//

import Foundation

enum N2YOEndpoint: Request {
    case passes(noradId: Int, latitude: Double, longitude: Double, altitude: Double, days: Int, minVisibility: Int)

    var path: String {
        switch self {
        case .passes:
            return "/visualpasses"
        }
    }

    var method: String {
        switch self {
        case .passes:
            return "GET"
        }
    }
    
    var url: URL? {
        switch self {
        case let .passes(noradId, latitude, longitude, altitude, days, minVisibility):
            let endpoint = "\(path)/\(noradId)/\(latitude)/\(longitude)/\(altitude)/\(days)/\(minVisibility)"
            var components = URLComponents(string: APIConfiguration.baseURLN2YO + endpoint)
            components?.queryItems = queryItems
            return components?.url
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .passes(let noradId, let latitude, let longitude, let altitude, let days, let minVisibility):
            return [
                URLQueryItem(name: "apiKey", value: APIConfiguration.apiKeyN2YO)
            ]
        }
    }
}

enum GroundPassBackendEndpoint: Request {
    case satelliteSearch(satelliteName: String)

    var path: String {
        switch self {
        case .satelliteSearch:
            return "/satelliteSearch"
        }
    }

    var method: String {
        switch self {
        case .satelliteSearch:
            return "GET"
        }
    }
    
    var url: URL? {
        switch self {
        case .satelliteSearch(_):
            let endpoint = "\(path)"
            var components = URLComponents(string: APIConfiguration.baseURLGroundPassBackend + endpoint)
            components?.queryItems = queryItems
            return components?.url
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .satelliteSearch(let satelliteName):
            return [
                URLQueryItem(name: "q", value: satelliteName)
            ]
        }
    }
}
