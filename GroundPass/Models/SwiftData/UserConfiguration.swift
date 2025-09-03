//
//  UserConfiguration.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 23/7/25.
//

import SwiftData

@Model
class UserConfiguration {
    var onboardingDone: Bool

    init(onboardingDone: Bool = false) {
        self.onboardingDone = onboardingDone
    }
}
