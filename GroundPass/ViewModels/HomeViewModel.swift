//
//  HomeViewModel.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 26/8/25.
//

import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var passes: [VisualPass] = []
    @Published var isLoading: Bool = false
    @Published var dayAndHour: String = ""
    
    private let n2yoService = N2YOService()
    private let locationService = LocationService()
    
    private var latitude: Double?
    private var longitude: Double?
    private var altitude: Double?
    
    private var hourDateTimer: Timer?
    
    init() {
        updateDayAndHour()
        scheduleNextUpdate()
    }
    
    deinit {
        hourDateTimer?.invalidate()
    }
    
    private func updateDayAndHour() {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE d, h:mm a"
        dayAndHour = formatter.string(from: now)
    }
    
    private func scheduleNextUpdate() {
        let calendar = Calendar.current
        let now = Date()
        
        let nextMinute = calendar.nextDate(after: now, matching: DateComponents(second: 0), matchingPolicy: .nextTime)!
        let interval = nextMinute.timeIntervalSince(now)
        
        hourDateTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { [weak self] _ in
            Task { @MainActor in
                self?.updateDayAndHour()
                self?.scheduleNextUpdate()
            }
        }
    }
    
    func fetchFavouritesSatellitesVisualPasses(favouriteSatellites: [FavouriteSatellite]) {
        passes.removeAll()
        isLoading = true
        locationService.requestLocation { lat, lon, alt in
            self.latitude = lat
            self.longitude = lon
            self.altitude = alt
            
            Task {
                for satellite in favouriteSatellites {
                    await self.fetchVisualPasses(with: satellite.noradId)
                }
            }
        }
    }
    
    private func fetchVisualPasses(with noradId: Int) async {
        guard let latitude = latitude,
              let longitude = longitude,
              let altitude = altitude else { return }
        Task {
            defer { isLoading = false }
            let result = await n2yoService.getVisualPasses(noradId: noradId, latitude: latitude, longitude: longitude, altitude: altitude, days: APIConfiguration.days, minVisbility: APIConfiguration.minVisibility)
            
            switch result {
            case .success(let passes):
                setPasses(passes)
            case .failure(_):
                break
            }
        }
            
    }
    
    func setPasses(_ newPasses: [VisualPass]) {
        passes.append(contentsOf: newPasses)
        passes.sort { $0.startUTC < $1.startUTC }
    }
}
