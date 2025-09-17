//
//  LocationService.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 26/8/25.
//

import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private var completion: ((Double, Double, Double) -> Void)?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func requestLocation(completion: @escaping (Double, Double, Double) -> Void) {
        self.completion = completion
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func requestLocation() async throws -> (latitude: Double, longitude: Double) {
        return try await withCheckedThrowingContinuation { continuation in
            requestLocation { lat, lon, alt in
                continuation.resume(returning: (lat, lon))
            }
        }
    }

    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            let altitude = location.altitude
            completion?(latitude, longitude, altitude)
            completion = nil
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error obteniendo ubicación: \(error.localizedDescription)")
    }
}
