//
//  Int.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 10/9/25.
//

extension Int {
    /// Converts the integer (seconds) to a string in the format "X min Y sec".
    /// Example: 555 -> "9 min 15 sec"
    func formattedAsMinutesAndSeconds() -> String {
        let minutes = String(self / 60)
        let seconds = String(self % 60)
        let text =  L10n.Extensions.Int.formatMinuteSeconds
        let textFormatted = String(format: text, minutes, seconds)
        return textFormatted
    }
}
