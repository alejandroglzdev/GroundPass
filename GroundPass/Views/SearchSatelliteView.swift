//
//  SearchSatelliteView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 17/9/25.
//

import SwiftUI

struct SearchSatelliteView: View {
    @StateObject private var viewModel: SearchSatelliteViewModel
    @EnvironmentObject var router: NavigationRouter


    @State private var searchText = ""
    @State private var isUserWritingTimer: DispatchWorkItem?
    
    init() {
        _viewModel = StateObject(wrappedValue: SearchSatelliteViewModel())
    }
    
    var body: some View {
        let popularSatellites = PopularSatellites.all
        let popularSatellitesRow: [IdentifiableView] = popularSatellites.map { satellite in
            IdentifiableView(view: AnyView(SearchedSatelliteRow(satelliteName: satellite.name, noradId: satellite.noradID)))
        }
        let popularSatelliteById: [UUID: Satellite] = Dictionary(uniqueKeysWithValues: zip(popularSatellitesRow.map { $0.id }, popularSatellites))
        
        VStack(alignment: .leading) {
            SearchBar(text: $searchText)
                .onChange(of: searchText) { oldValue, newValue in
                    isUserWritingTimer?.cancel()
                    
                    let task = DispatchWorkItem {
                        if !newValue.isEmpty {
                            Task {
                                await viewModel.searchSatellite(with: newValue)
                            }
                        } else {
                            viewModel.searchedSatellites = nil
                        }
                    }
                    
                    isUserWritingTimer = task
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: task)
                }
            
            if let searchedSatellites = viewModel.searchedSatellites {
                HeaderText(text: L10n.SearchSatelliteView.searchedSatelliteTitle)
                    .padding(.vertical, 18)
                
                if searchedSatellites.isEmpty {
                    Text(L10n.SearchSatelliteView.noSatelliteFoundBody)
                } else {
                    let searchedSatellitesRow: [IdentifiableView] = searchedSatellites.map { satellite in
                        IdentifiableView(view: AnyView(SearchedSatelliteRow(satelliteName: satellite.name, noradId: satellite.noradID)))
                    }
                    let searchedSatelliteById: [UUID: Satellite] = Dictionary(uniqueKeysWithValues: zip(searchedSatellitesRow.map { $0.id }, searchedSatellites))

                    TwoColumnList(rows: searchedSatellitesRow, onTapGesture: { id in
                        if let satellite = searchedSatelliteById[id] {
                            router.push(.satelliteDetail(satellite))
                        }
                    })
                }
            } else {
                HeaderText(text: L10n.SearchSatelliteView.popularSatelliteTitle)
                    .padding(.vertical, 18)
                
                TwoColumnList(rows: popularSatellitesRow, onTapGesture: { id in
                    if let satellite = popularSatelliteById[id] {
                        router.push(.satelliteDetail(satellite))
                    }
                })
            }
            
            Spacer()
        }
        .padding(25)
    }
}
