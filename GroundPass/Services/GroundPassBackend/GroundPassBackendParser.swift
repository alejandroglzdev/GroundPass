//
//  GroundPassBackendParser.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 23/9/25.
//

import Foundation

final class GroundPassBackendParser {
    static func parseSatellites(response: Data) -> [Satellite] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        do {
            let fullResponse = try decoder.decode([Satellite].self, from: response)
            return fullResponse
        } catch {
            return []
        }
    }
    
    static func parseSatellite(response: Data) -> Satellite? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        do {
            let fullResponse = try decoder.decode(Satellite.self, from: response)
            return fullResponse
        } catch {
            return nil
        }
    }
}
