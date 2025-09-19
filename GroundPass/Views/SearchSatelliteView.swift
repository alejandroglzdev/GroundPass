//
//  SearchSatelliteView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 17/9/25.
//

import SwiftUI

struct SearchSatelliteView: View {
    @State private var searchText = ""
    
    var body: some View {
        let popularSatellites = FamousSatellites.all
        let rows: [IdentifiableView] = popularSatellites.map { satellite in
            IdentifiableView(view: AnyView(PopularSatelliteRow(satelliteName: satellite.name)))
        }
        
        VStack(alignment: .leading) {
            SearchBar(text: $searchText)
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
