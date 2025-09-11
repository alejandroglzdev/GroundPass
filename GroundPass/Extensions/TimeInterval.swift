//
//  TimeInterval.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 3/9/25.
//

import Foundation

extension TimeInterval {
    /// Returns a string representing the time interval as "EEE d h:mm a".
    /// Example: 1672531800 -> "Mon 5 3:30 PM"
    func formatToWeekdayDay12HourClock() -> String {
        let date = Date(timeIntervalSince1970: self)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE d h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter.string(from: date)
    }
    
    /// Converts the TimeInterval to a UTC string in the format "yyyy-MM-dd HH:mm:ss 'UTC'".
    /// Example: 1711068300 -> "2024-03-22 21:45:00 UTC"
    func formattedAsUTCDateTime() -> String {
        let date = Date(timeIntervalSince1970: self)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss 'UTC'"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.string(from: date)
    }
    
    /// Converts the TimeInterval to a string showing only the time in 12-hour format with AM/PM.
    /// Example: 1711068300 -> "9:35 PM"
    func formattedAs12HourTime() -> String {
        let date = Date(timeIntervalSince1970: self)
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter.string(from: date)
    }
}
