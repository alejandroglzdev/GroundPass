//
//  ShowMoreView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 4/9/25.
//

import SwiftUI

public struct ShowMoreView: View {
    @StateObject private var viewModel: ShowMoreViewModel
    @EnvironmentObject var router: NavigationRouter
    
    init(passes: [VisualPass]) {
        _viewModel = StateObject(wrappedValue: ShowMoreViewModel(passes: passes))
    }

    public var body: some View {
        VStack(alignment: .leading) {
            List {
                Section {
                    ForEach(viewModel.passes, id: \.id) { pass in
                        SatellitePassRow(imageURL: nil, visualPass: pass)
                    }
                }
                .textCase(nil)
            }
            .padding(.top, 10)
            .listStyle(InsetGroupedListStyle())
            .scrollContentBackground(.hidden)
        }
        .navigationTitle(L10n.ShowMore.topBarTitle)
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
    
}
