//
//  SolarCalculation.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 10/9/25.
//

import Foundation
import CoreLocation

struct AstronomicCalculation {
    static func solarElevation(date: Date, latitude: Double, longitude: Double) -> Double {
        // Convert the date to Julian Day
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let Y = Double(components.year!)
        let M = Double(components.month!)
        let D = Double(components.day!)
        let H = Double(components.hour!)
        let Min = Double(components.minute!)
        let S = Double(components.second!)
        
        // Approximate Julian Day
        let A = 367 * Y
        let B = Double(Int((7 * (Y + Double(Int((M + 9)/12)))) / 4))
        let C = Double(Int((275 * M) / 9))
        let dayFraction = D + (H + Min/60 + S/3600)/24
        let jd = A - B + C + dayFraction + 1721013.5
        
        let n = jd - 2451545.0 // Days since J2000 (January 1, 2000, 12:00 TT)
        
        // Mean longitude of the Sun
        var L = 280.46 + 0.9856474 * n
        L = fmod(L, 360)
        
        // Mean anomaly of the Sun
        var g = 357.528 + 0.9856003 * n
        g = fmod(g, 360)
        
        // Convert to radians (sin() function in Swift works with radians)
        let gRad = g * Double.pi / 180
        
        // Ecliptic longitude
        let lambda = L + 1.915 * sin(gRad) + 0.020 * sin(2 * gRad)
        let lambdaRad = lambda * Double.pi / 180
        
        // Obliquity of the ecliptic
        let epsilon = 23.439 - 0.0000004 * n
        let epsilonRad = epsilon * Double.pi / 180
        
        // Right ascension and declination
        let alpha = atan2(cos(epsilonRad) * sin(lambdaRad), cos(lambdaRad))
        let delta = asin(sin(epsilonRad) * sin(lambdaRad))
        
        // Local hour angle in degrees
        let timeUTC = H + Min/60 + S/3600
        let lst = 100.46 + 0.985647 * n + longitude + 15 * timeUTC
        let Hangle = fmod(lst - alpha * 180 / Double.pi, 360)
        let Hrad = Hangle * Double.pi / 180
        
        // Solar elevation
        let latRad = latitude * Double.pi / 180
        let elevation = asin(sin(latRad)*sin(delta) + cos(latRad)*cos(delta)*cos(Hrad))
        
        return elevation * 180 / Double.pi // in degrees
    }
}
