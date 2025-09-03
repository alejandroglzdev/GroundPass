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
    
    @State private var selectedSatellitesNoradId: [Int] = []
    
    @Query private var configList: [UserConfiguration]
    @Query private var favouriteSatellites: [FavouriteSatellite]

    var userConfiguration: UserConfiguration? {
        configList.first
    }
    
    var isSaveButtonEnabled: Bool {
        selectedSatellitesNoradId.count == 3
    }
    
    var body: some View {
        let famousSatellites = FamousSatellites.all
        
        VStack(alignment: .leading) {
            List {
                Section {
                    ForEach(famousSatellites) { item in
                        SatelliteRow(item: item)
                            .padding(.trailing, 32)
                            .overlay(
                                Rectangle()
                                    .frame(width: 2)
                                    .foregroundColor(Color.backgroundContrasting)
                                    .opacity(selectedSatellitesNoradId.contains(where: {$0 == item.id}) ? 1 : 0)
                                    .animation(.easeInOut(duration: 0.3), value: selectedSatellitesNoradId),
                                alignment: .trailing
                                
                            )
                            .onTapGesture(perform: {
                                if let index = selectedSatellitesNoradId.firstIndex(where: {$0 == item.id}) {
                                    selectedSatellitesNoradId.remove(at: index)
                                } else if selectedSatellitesNoradId.count < 3 {
                                    selectedSatellitesNoradId.append(item.id)
                                }
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
            
            RoundedButton(action: finishOnboarding, text: L10n.OnboardingSelection.button,
                          isEnabled: isSaveButtonEnabled,
                          maxWidth: .infinity
            ).padding()
            
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
        for noradId in selectedSatellitesNoradId {
            guard !favouriteSatellites.contains(where: { $0.noradId == noradId }) else { continue }
            let favouriteSatellite = FavouriteSatellite(noradId: noradId)
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
