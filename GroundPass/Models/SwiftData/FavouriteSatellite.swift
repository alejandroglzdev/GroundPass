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
    var name: String
    
    init(noradId: Int, name: String) {
        self.noradId = noradId
        self.name = name
    }
}
