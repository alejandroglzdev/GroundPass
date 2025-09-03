//
//  GroundPassApp.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 19/6/25.
//

import SwiftUI
import SwiftData

@main
struct GroundPassApp: App {
    @Environment(\.modelContext) private var context

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [UserConfiguration.self, FavouriteSatellite.self])
    }
}
