//
//  OnboardingSelectionView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 17/7/25.
//

import SwiftUI
import SwiftData

struct OnboardingSelectionView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var router: NavigationRouter
    
    @State private var selectedSatellites: [FavouriteSatellite] = []
    
    @Query private var configList: [UserConfiguration]
    @Query private var favouriteSatellites: [FavouriteSatellite]

    var userConfiguration: UserConfiguration? {
        configList.first
    }
    
    var isSaveButtonEnabled: Bool {
        selectedSatellites.count == 3
    }
    
    var body: some View {
        let popularSatellites = PopularSatellites.all
        
        VStack(alignment: .leading) {
            List {
                Section {
                    ForEach(popularSatellites, id: \.id) { item in
                        SatelliteRow(item: item)
                            .padding(.trailing, 32)
                            .overlay(
                                Rectangle()
                                    .frame(width: 2)
                                    .foregroundColor(Color.backgroundContrasting)
                                    .opacity(setOpacity(for: item))
                                    .animation(.easeInOut(duration: 0.3), value: selectedSatellites),
                                alignment: .trailing
                                
                            )
                            .onTapGesture(perform: {
                                toggleSelection(for: item)
                            })
                    }
                } header: {
                    ListHeaderText(text: L10n.OnboardingSelection.header)
                }
                .textCase(nil)
            }
            .padding(.top, 10)
            .listStyle(InsetGroupedListStyle())
            .scrollContentBackground(.hidden)
            
            RoundedButton(text: L10n.OnboardingSelection.button, isEnabled: isSaveButtonEnabled, maxWidth: .infinity, action: finishOnboarding)
                .padding()
            
        }
        .navigationTitle(L10n.OnboardingSelection.topBarTitle)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    router.pop()
                }) {
                    Image(systemName: "chevron.left")
                        .tint(Color.backgroundContrasting)
                }
            }
        }
        .background(Color.background)
    }
    
    private func setOpacity(for item: Satellite) -> Double {
        let isSelected = selectedSatellites.contains(where: {$0.noradId == item.noradID})
        return isSelected ? 1 : 0
    }
    
    private func toggleSelection(for item: Satellite) {
        if let index = selectedSatellites.firstIndex(where: { $0.noradId == item.noradID }) {
            selectedSatellites.remove(at: index)
        } else if selectedSatellites.count < 3 {
            let favourite = FavouriteSatellite(noradId: item.noradID, name: item.name)
            selectedSatellites.append(favourite)
        }
    }
    
    private func finishOnboarding() {
        router.clearRoot()
        persistOnboardingUserConfig()
        persistFavouriteSatellites()
    }
    
    private func persistOnboardingUserConfig() {
        if let userConfiguration = userConfiguration {
            userConfiguration.onboardingDone = true
            context.insert(userConfiguration)
            try? context.save()
        } else {
            let defaultConfig = UserConfiguration()
            defaultConfig.onboardingDone = true
            context.insert(defaultConfig)
            try? context.save()
        }
    }
    
    private func persistFavouriteSatellites() {
        for satellite in selectedSatellites {
            guard !favouriteSatellites.contains(where: { $0.noradId == satellite.noradId }) else { continue }
            let favouriteSatellite = FavouriteSatellite(noradId: satellite.noradId, name: satellite.name)
            context.insert(favouriteSatellite)
            try? context.save()
        }
    }
}

#Preview {
    NavigationStack {
        OnboardingSelectionView()
    }
}
