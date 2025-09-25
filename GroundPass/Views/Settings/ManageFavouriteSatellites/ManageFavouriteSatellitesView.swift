//
//  ManageFavouriteSatellitesView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 24/9/25.
//

import SwiftUI
import SwiftData

struct ManageFavouriteSatellitesView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var router: NavigationRouter
    
    @Query private var favouriteSatellites: [FavouriteSatellite]

    var body: some View {
        VStack {
            Text(L10n.ManageFavouriteSatellitesView.maxFavouriteSatellitesWarning)
            
            List {
                Section {
                    ForEach(favouriteSatellites, id: \.id) { favouriteSatellite in
                        let noradId = favouriteSatellite.noradId
                        let name = favouriteSatellite.name
                        ManageFavouriteSatelliteRow(satelliteName: name,
                                                    noradId: String(noradId),
                                                    onDelete: { deleteFavouriteSatellite(noradId: noradId, name: name) })
                            .listRowInsets(EdgeInsets())
                            .padding(.vertical, 18)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .scrollContentBackground(.hidden)
            
            Spacer()
        }
        .padding(25)
        .navigationTitle(L10n.ManageFavouriteSatellitesView.title)
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
    }
    
    func deleteFavouriteSatellite(noradId: Int, name: String) {
        if let satelliteToDelete = favouriteSatellites.first(where: { $0.noradId == noradId }) {
            context.delete(satelliteToDelete)
            try? context.save()
        }
    }
}

#Preview {
    ManageFavouriteSatellitesView()
}
