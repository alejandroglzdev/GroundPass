//
//  SettingsView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 23/9/25.
//

import SwiftUI

struct SettingsView: View {
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
//                router.push(.)
            })
                .padding(.vertical, 12)
        }
    }
    
    
    
}

#Preview {
    SettingsView()
}
