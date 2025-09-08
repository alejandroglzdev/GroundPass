//
//  MainView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 24/7/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text(L10n.TabBar.home)
                    }
            }
        }
    }
}

#Preview {
    MainView()
}
