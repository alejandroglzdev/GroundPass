//
//  MainView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 24/7/25.
//

import SwiftUI

struct MainView: View {
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.backgroundSecondary
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text(L10n.TabBar.home)
                    }
                SearchSatelliteView()
                    .tabItem {
                        Image("satellite_icon")
                        Text(L10n.TabBar.satellites)
                    }
            }
        }
    }
}

#Preview {
    MainView()
}
