//
//  SettingsView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 23/9/25.
//

import SwiftUI

struct SettingsView: View {
    @State private var showModal = false
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        VStack(alignment: .center) {
            Text(L10n.SettingsView.title)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.top, 24)
            
            VStack(alignment: .leading) {
                generalSection
                aboutSection
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            
            Spacer()
        }
        .sheet(isPresented: $showModal) {
            BottomSheetModal(header: L10n.AboutUsModal.header,
                             bodyText: L10n.AboutUsModal.bodyText,
                             bodyTextBold: L10n.AboutUsModal.bodyTextBold, headerImage: "heart.fill",
                             buttonText: L10n.AboutUsModal.tipButtonText,
                             buttonImage: "dollarsign"
            ) {
                if let url = URL(string: Constants.buyMeACoffeURL) {
                    UIApplication.shared.open(url)
                }
            }
            .presentationDetents([.fraction(0.6)])
            .presentationDragIndicator(.visible)
        }
    }
    
    var generalSection: some View {
        VStack(alignment: .leading) {
            Text(L10n.SettingsView.GeneralSection.title)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.top, 24)
            
            SettingsRow(text: L10n.SettingsView.GeneralSection.manageFavouriteSatellitesButton, onTap: {
                router.push(.manageFavouriteSatellitesView)
            })
            .padding(.vertical, 12)
        }
    }
    
    var aboutSection: some View {
        VStack(alignment: .leading) {
            Text(L10n.SettingsView.AboutSection.title)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.top, 24)
            
            SettingsRow(text: L10n.SettingsView.AboutSection.aboutUsButton, onTap: {
                showModal = true
            })
            .padding(.vertical, 12)
        }
    }
}

#Preview {
    SettingsView()
}
