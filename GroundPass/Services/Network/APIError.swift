//
//  APIError.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 27/8/25.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case networkError(Error)
    case noData
    case decodingError(Error)
    case unauthorized
    case forbidden
    case notFound
    case serverError(Int)
    case unknown
    case invalidResponse
}
