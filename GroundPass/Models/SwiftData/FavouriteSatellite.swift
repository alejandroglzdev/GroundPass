//
//  FavouriteSatellites.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 23/7/25.
//

import SwiftData

@Model
class FavouriteSatellite {
    var noradId: Int
    
    init(noradId: Int) {
        self.noradId = noradId
    }
}
