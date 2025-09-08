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
    @EnvironmentObject var router: NavigationRouter
    
    @Query private var favouriteSatellites: [FavouriteSatellite]
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                Image("day_wallpaper")
                    .resizable()
                    .frame(height: 250)
                    .scaledToFit()

                let dayAndHour = viewModel.dayAndHour
                HeaderText(text: dayAndHour)
                    .padding([.leading, .bottom], 16)
            }
            
            List {
                if viewModel.isLoading {
                    HStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                    }
                } else {
                    Section {
                        ForEach(viewModel.passes.prefix(3), id: \.id) { pass in
                            SatellitePassRow(imageURL: nil, visualPass: pass)
                        }
                    } header: {
                        ListHeaderText(text: "GroundPass")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .textCase(nil)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .scrollContentBackground(.hidden)
            .frame(height: 350)
            
            HStack {
                if !viewModel.isLoading {
                    Spacer()
                    RoundedButton(action: { router.push(.showMoreView(viewModel.passes)) }, text: L10n.Home.showMoreButtonText)
                        .padding(.trailing, 16)
                        .padding(.top, 12)
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
        .onAppear(perform: fetchFavouritesSatellitesVisualPasses)
    }
    
    func fetchFavouritesSatellitesVisualPasses() {
        viewModel.fetchFavouritesSatellitesVisualPasses(favouriteSatellites: favouriteSatellites)
    }
}

#Preview {
    HomeView()
}
