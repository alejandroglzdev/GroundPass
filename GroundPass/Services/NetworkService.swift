//
//  NetworkService.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 27/8/25.
//

import Foundation

final class NetworkService {
    func request(with endpoint: Request) async -> Result<Data, APIError> {
        guard let url = endpoint.url else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                return .failure(.invalidResponse)
            }
            
            return .success(data)

            
        } catch {
            return .failure(.networkError(error))
        }
    }
}
