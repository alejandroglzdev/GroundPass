//
//  ContentView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 19/6/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var router = NavigationRouter()
    @Environment(\.modelContext) private var context
    @Query private var configList: [UserConfiguration]
    
    var userConfiguration: UserConfiguration? {
        configList.first
    }
    
    var onboardingDone: Bool {
        userConfiguration?.onboardingDone ?? false
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            Group {
                if onboardingDone {
                    MainView()
                        .environmentObject(router)
                } else {
                    OnboardingView()
                        .environmentObject(router)
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .onboardingSelectionView:
                    OnboardingSelectionView()
                        .environmentObject(router)
                case .onboardingView:
                    OnboardingView()
                        .environmentObject(router)
                case .mainView:
                    MainView()
                        .environmentObject(router)
                case .showMoreView(let passes):
                    ShowMoreView(passes: passes)
                        .environmentObject(router)
                case .visualPassDetailView(let pass):
                    VisualPassDetailView(pass: pass)
                        .environmentObject(router)
                case .satelliteDetailView(let satellite):
                    SatelliteDetailView(satellite: satellite)
                        .environmentObject(router)
                case .manageFavouriteSatellitesView:
                    ManageFavouriteSatellitesView()
                        .environmentObject(router)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

