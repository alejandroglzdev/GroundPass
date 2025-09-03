//
//  HomeView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 24/7/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var context
    @Query private var favouriteSatellites: [FavouriteSatellite]
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                Image("day_wallpaper")
                    .resizable()
                    .frame(height: 250)
                    .scaledToFit()

                let dayAndHour = "Thursday, 10:00 AM"
                HeaderText(text: dayAndHour)
                    .padding([.leading, .bottom], 16)
            }
            
            List {
                Section {
                    SatellitePassRow(imageURL: nil)
                    SatellitePassRow(imageURL: nil)
                    SatellitePassRow(imageURL: nil)
                } header: {
                    ListHeaderText(text: "GroundPass")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .textCase(nil)
            }
            .listStyle(InsetGroupedListStyle())
            .scrollContentBackground(.hidden)
            .frame(height: 350)
            
            HStack {
                Spacer()
                RoundedButton(action: { fetchFavouritesSatellitesVisualPasses() }, text: L10n.Home.showMoreButtonText)
                    .padding(.trailing, 16)
                    .padding(.top, 12)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
        .onAppear(perform: fetchFavouritesSatellitesVisualPasses)
        .onChange(of: viewModel.passes) { passes in
            print(passes)
        }
    }
    
    func fetchFavouritesSatellitesVisualPasses() {
        viewModel.fetchFavouritesSatellitesVisualPasses(favouriteSatellites: favouriteSatellites)
    }
}

#Preview {
    HomeView()
}
