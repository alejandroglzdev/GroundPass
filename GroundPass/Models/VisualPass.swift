//
//  VisualPass.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 3/9/25.
//

import Foundation

struct VisualPass: Decodable, Identifiable, Equatable, Hashable{
    let id = UUID()
    let noradId: Int
    let satelliteName: String
    let startAz: Double
    let startAzCompass: String
    let startEl: Double
    let startUTC: TimeInterval
    let maxAz: Double
    let maxAzCompass: String
    let maxEl: Double
    let maxUTC: TimeInterval
    let endAz: Double
    let endAzCompass: String
    let endEl: Double
    let endUTC: TimeInterval
    let mag: Double
    let duration: Int
    let startVisibility: TimeInterval
    
    /// Determines if the satellite is illuminated at the time of maximum elevation.
    /// - Parameters:
    ///   - latitude: Observer latitude [deg]
    ///   - longitude: Observer longitude [deg]
    /// - Returns: true if the satellite is illuminated

    func isIlluminated(latitude: Double, longitude: Double) -> Bool {
        let date = Date(timeIntervalSince1970: maxUTC)
        
        // Unit vector to satellite
        let r_sat_unit = AstronomicCalculation.topocentricToECI(
            az: maxAz,
            el: maxEl,
            lat: latitude,
            lon: longitude,
            date: date
        )
        
        // Use provided altitude if available, otherwise default
        let altitude = AstronomicCalculation.defaultAltitudeKm
        let r_sat = Vector3(
            x: r_sat_unit.x * (6378.137 + altitude),
            y: r_sat_unit.y * (6378.137 + altitude),
            z: r_sat_unit.z * (6378.137 + altitude)
        )
        
        let jd = AstronomicCalculation.julianDate(from: date)
        let r_sun = AstronomicCalculation.sunPositionECI(julianDate: jd)
        
        return AstronomicCalculation.isIlluminated(rSat: r_sat, rSun: r_sun)
    }
    
    func satelliteIsVisible(latitude: Double, longitude: Double) async -> SatelliteVisibility {
        // 1. Check if the satellite is illuminated by the Sun
        //    If the satellite is in Earth's shadow, it's not visible
        let satelliteIsIlluminated = isIlluminated(latitude: latitude, longitude: longitude)
        if !satelliteIsIlluminated {
            return .notVisible
        }
        
        // 2. Compute the solar elevation for the observer
        //    If the Sun is higher than -6°, there is still too much light in the sky
        let solarElevation = AstronomicCalculation.solarElevation(date: Date.now,
                                                                  latitude: latitude,
                                                                  longitude: longitude)
        if solarElevation > -6.0 {
            return .notVisible
        }
        
        // 3. Evaluate maximum elevation of the satellite during the pass
        //    This determines how high it gets above the horizon
        let maxElevation = self.maxEl
        
        // 4. Optionally use the magnitude (brightness) if available
        let magnitude = self.mag
        
        // 5. Decide the visibility level
        //    - Below 12°: not visible
        //    - Between 12° and 30°: visible with difficulty
        //    - Above 30°: clearly visible
        //    Adjust by magnitude if provided
        if maxElevation < 12.0 {
            return .notVisible
        }
        
        if maxElevation >= 30.0 {
            // If magnitude available and very dim (>5.5), downgrade to difficult
            if magnitude > 5.5 {
                return .difficult
            }
            return .clear
        }
        
        if maxElevation >= 12.0 && maxElevation < 30.0 {
            // If bright enough (<=4.5) we can promote to clear, else difficult
            if magnitude <= 4.5 {
                return .clear
            }
            return .difficult
        }
        
        // Fallback case (should never be reached)
        return .notVisible
    }
}

enum SatelliteVisibility {
    case clear
    case difficult
    case notVisible
}

struct VisualPassResponse: Decodable {
    struct Pass: Decodable {
        let startAz: Double
        let startAzCompass: String
        let startEl: Double
        let startUTC: TimeInterval
        let maxAz: Double
        let maxAzCompass: String
        let maxEl: Double
        let maxUTC: TimeInterval
        let endAz: Double
        let endAzCompass: String
        let endEl: Double
        let endUTC: TimeInterval
        let mag: Double
        let duration: Int
        let startVisibility: TimeInterval
    }

    let noradId: Int
    let satelliteName: String
    let passes: [Pass]

    private enum CodingKeys: String, CodingKey {
        case info
        case passes
    }

    private enum InfoKeys: String, CodingKey {
        case satid
        case satname
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let infoContainer = try container.nestedContainer(keyedBy: InfoKeys.self, forKey: .info)
        noradId = try infoContainer.decode(Int.self, forKey: .satid)
        satelliteName = try infoContainer.decode(String.self, forKey: .satname)
        passes = try container.decode([Pass].self, forKey: .passes)
    }
}
