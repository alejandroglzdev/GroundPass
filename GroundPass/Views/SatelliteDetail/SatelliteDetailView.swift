//
//  SatelliteDetailView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 23/9/25.
//

import SwiftUI
import SwiftData

enum FavouriteStatus {
    case favourite
    case notFavourite
}

public struct SatelliteDetailView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var router: NavigationRouter
    @StateObject private var viewModel: SatelliteDetailViewModel
    
    @Query private var favouriteSatellites: [FavouriteSatellite]
    
    var favouriteStatus: FavouriteStatus {
        if favouriteSatellites.contains(where: { $0.noradId == viewModel.satellite?.noradID }) {
            return .favourite
        } else {
            return .notFavourite
        }
    }
    
    var buttonPurpose: ButtonPurpose {
        if favouriteStatus == .favourite {
            .delete
        }
        else {
            .standard
        }
    }
    
    init(satellite: Satellite) {
        _viewModel = StateObject(wrappedValue: SatelliteDetailViewModel(noradId: satellite.noradID))
    }
    
    public var body: some View {
        let unknownText = L10n.SatelliteDetail.unknown
        
        VStack(alignment: .trailing) {
            if let satellite = viewModel.satellite {
                ScrollView {
                    Image("satellite_detail_placeholder")
                        .resizable()
                        .scaledToFit()
                    
                    let satelliteName = satellite.name
                    let noradID = String(satellite.noradID)
                    let country = satellite.country ?? unknownText
                    SatelliteDetailHeader(satelliteName: satelliteName, noradID: noradID, country: country).padding(24)
                    
                    let launchDate = satellite.launchDate ?? unknownText
                    let launchLocation = satellite.launchLocation ?? unknownText
                    LaunchInfo(launchDate: launchDate, launchLocation: launchLocation).padding(24)
                    
                    let apogee = satellite.apogee ?? unknownText
                    let perigee = satellite.perigee ?? unknownText
                    let inclination = satellite.inclination ?? unknownText
                    let period = satellite.period ?? unknownText
                    
                    OrbitInfo(apogee: apogee, perigee: perigee, inclination: inclination, period: period).padding(24)
                    
                    let status = if satellite.status == "Y" {
                        L10n.SatelliteDetail.StatusInfo.active
                    } else {
                        L10n.SatelliteDetail.StatusInfo.inactive
                    }
                    
                    let typePurpose: String = satellite.typePurpose ?? unknownText
                    
                    StatusInfo(status: status, typePurpose: typePurpose).padding(24)
                }
                
                RoundedButton(text: configureButtonText(), buttonPurpose: buttonPurpose, action: {
                    if favouriteStatus == .notFavourite {
                        if favouriteSatellites.count < 3 {
                            addSatelliteToFavourite(noradId: viewModel.satellite?.noradID, name: viewModel.satellite?.name)
                        } else {
                            print("Mostrar modal...")
                        }
                    } else {
                        deleteFavouriteSatellite(noradId: viewModel.satellite?.noradID)
                    }
                }).padding(18)
                
            } else {
                ProgressView().padding(24)
            }
            
        }
        .navigationTitle(L10n.SatelliteDetail.topBarTitle)
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
    
    private func addSatelliteToFavourite(noradId: Int?, name: String?) {
        guard let noradId = noradId, let name = name else { return }
        
        let favouriteSatellite = FavouriteSatellite(noradId: noradId, name: name)
        context.insert(favouriteSatellite)
        try? context.save()
    }
    
    private func deleteFavouriteSatellite(noradId: Int?) {
        guard let noradId else { return }
        
        //TODO: Hacer clase que controle el añadir y eliminar
        if let satelliteToDelete = favouriteSatellites.first(where: { $0.noradId == noradId }) {
            context.delete(satelliteToDelete)
            try? context.save()
        }
    }
    
    private func configureButtonText() -> String{
        if favouriteStatus == .favourite {
            return L10n.SatelliteDetail.deleteFavouriteButtonText
        } else {
            return L10n.SatelliteDetail.addFavouriteButtonText
        }
    }
}
