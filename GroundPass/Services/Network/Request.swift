//
//  Endpoints.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 26/8/25.
//

import Foundation

protocol Request {
    var path: String { get }
    var method: String { get }
    var queryItems: [URLQueryItem]? { get }
    var url: URL? { get }
}

extension Request {
    var url: URL? {
        var components = URLComponents(string: APIConfiguration.baseURLN2YO + path)
        components?.queryItems = queryItems
        return components?.url
    }
}
