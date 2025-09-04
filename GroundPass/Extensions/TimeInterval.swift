//
//  TimeInterval.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 3/9/25.
//

import Foundation

extension TimeInterval {
    func formatToWeekdayDay12HourClock() -> String {
        let date = Date(timeIntervalSince1970: self)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE d h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter.string(from: date)
    }
}
