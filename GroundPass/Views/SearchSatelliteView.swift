//
//  SearchSatelliteView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 17/9/25.
//

import SwiftUI

struct SearchSatelliteView: View {
    @State private var searchText = ""
    @State private var isUserWritingTimer: DispatchWorkItem?
    
    var body: some View {
        let popularSatellites = PopularSatellites.all
        let rows: [IdentifiableView] = popularSatellites.map { satellite in
            IdentifiableView(view: AnyView(PopularSatelliteRow(satelliteName: satellite.name)))
        }
        
        VStack(alignment: .leading) {
            SearchBar(text: $searchText)
                .onChange(of: searchText) { oldValue, newValue in
                    isUserWritingTimer?.cancel()
                    
                    let task = DispatchWorkItem {
                        // Search logic
                        print("Searching for... \(newValue)")
                    }
                    
                    isUserWritingTimer = task
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: task)
                }
            
            HeaderText(text: L10n.SearchSatelliteView.popularSatelliteTitle)
                .padding(.vertical, 18)
            
            TwoColumnList(rows: rows)
            
            Spacer()
        }
        .padding(25)
    }
}

#Preview {
    SearchSatelliteView()
}
