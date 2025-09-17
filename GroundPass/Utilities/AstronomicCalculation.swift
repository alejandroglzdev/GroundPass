//
//  SolarCalculation.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 10/9/25.
//

import Foundation
import CoreLocation

struct AstronomicCalculation {
    static let defaultAltitudeKm = 400.0 // km
    
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
    
    static func topocentricToECI(az: Double, el: Double, lat: Double, lon: Double, date: Date) -> Vector3 {
        let deg2rad = Double.pi / 180.0
        
        let azRad = az * deg2rad
        let elRad = el * deg2rad
        let latRad = lat * deg2rad
        let lonRad = lon * deg2rad
        
        // 1. Vector in topocentric system (SEZ: South-East-Zenith)
        let xTop = cos(elRad) * sin(azRad)
        let yTop = cos(elRad) * cos(azRad)
        let zTop = sin(elRad)
        
        let topVec = Vector3(x: xTop, y: yTop, z: zTop)
        
        // 2. Convert from topocentric to ECEF (Earth-fixed)
        // Rotation by lat/lon
        let sinLat = sin(latRad), cosLat = cos(latRad)
        let sinLon = sin(lonRad), cosLon = cos(lonRad)
        
        let x = -sinLat*cosLon*xTop - sinLon*yTop + cosLat*cosLon*zTop
        let y = -sinLat*sinLon*xTop + cosLon*yTop + cosLat*sinLon*zTop
        let z = cosLat*xTop + sinLat*zTop
        
        let losECEF = Vector3(x: x, y: y, z: z)
        
        // 3. Convert from ECEF to ECI (correcting for Earth rotation)
        let gmst = greenwichSiderealTime(date: date) // en radianes
        let cosG = cos(gmst), sinG = sin(gmst)
        
        let xECI = cosG*losECEF.x - sinG*losECEF.y
        let yECI = sinG*losECEF.x + cosG*losECEF.y
        let zECI = losECEF.z
        
        return Vector3(x: xECI, y: yECI, z: zECI)
    }
    
    static func sunPositionECI(julianDate d: Double) -> Vector3 {
        let deg2rad = Double.pi / 180.0
        let AU = 149597870.7 // km
        
        // Time in centuries since J2000
        let T = (d - 2451545.0) / 36525.0
        
        // Mean length of the Sun
        let L = (280.460 + 36000.770*T).truncatingRemainder(dividingBy: 360.0)
        // Average anomaly
        let M = 357.528 + 35999.050*T
        let M_rad = M * deg2rad
        
        // Equation of the center
        let C = (1.915 * sin(M_rad) + 0.020 * sin(2*M_rad))
        
        // Ecliptic longitude
        let lambda = (L + C) * deg2rad
        
        // Obliquity of the ecliptic
        let eps = (23.4393 - 0.0130*T) * deg2rad
        
        // Unit vector Sun in AU
        let x = cos(lambda)
        let y = cos(eps) * sin(lambda)
        let z = sin(eps) * sin(lambda)
        
        return Vector3(x: x*AU, y: y*AU, z: z*AU)
    }
    
    /// Calculate Greenwich Mean Sidereal Time (GMST) in radians
    /// - Parameter date: Date in UTC
    /// - Returns: GMST in radians [0, 2π]
    static func greenwichSiderealTime(date: Date) -> Double {
        // 1. Convert Date to Julian Date (JD)
        let jd = julianDate(from: date)
        
        // 2. Julian centuries since J2000.0
        let T = (jd - 2451545.0) / 36525.0
        
        // 3. GMST in seconds
        // Formula from "Astronomical Algorithms" by Jean Meeus
        var GMST = 67310.54841 + (876600*3600 + 8640184.812866) * T
        GMST += 0.093104 * T*T - 6.2e-6 * T*T*T
        
        // Convert to degrees
        GMST = fmod(GMST / 240.0, 360.0) // 1 sidereal sec = 1/240 deg
        
        if GMST < 0 { GMST += 360.0 }
        
        // Convert to radians
        return GMST * Double.pi / 180.0
    }

    /// Convert Date to Julian Date
    static func julianDate(from date: Date) -> Double {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents(in: TimeZone(secondsFromGMT: 0)!, from: date)
        
        let year = components.year!
        let month = components.month!
        let day = Double(components.day!)
        let hour = Double(components.hour!)
        let minute = Double(components.minute!)
        let second = Double(components.second!)
        
        var Y = year
        var M = month
        if M <= 2 {
            Y -= 1
            M += 12
        }
        
        let A = floor(Double(Y)/100.0)
        let B = 2 - A + floor(A/4.0)
        
        let JD_day = floor(365.25 * Double(Y + 4716)) +
                     floor(30.6001 * Double(M + 1)) +
                     day + B - 1524.5
        
        let JD_fraction = (hour + minute/60.0 + second/3600.0) / 24.0
        
        return JD_day + JD_fraction
    }
    
    /// Determines if a satellite is illuminated by the Sun
    /// - Parameters:
    ///   - rSat: Satellite position in ECI [km]
    ///   - rSun: Sun position in ECI [km]
    ///   - earthRadius: Earth's radius [km] (default WGS-84)
    /// - Returns: true if illuminated, false if in Earth's shadow
    static func isIlluminated(rSat: Vector3, rSun: Vector3, earthRadius: Double = 6378.137) -> Bool {
        // Project satellite vector onto Sun vector
        let projScale = rSat.dot(rSun) / rSun.dot(rSun)
        let proj = projScale * rSun
        
        // Distance perpendicular from satellite to Sun-Earth line
        let dVec = rSat - proj
        let d = dVec.norm()
        
        // If distance > Earth's radius, satellite is illuminated
        return d > earthRadius
    }
}
