//
//  OnboardingView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 17/7/25.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        VStack {
            Image("satellite_image")
                .resizable()
                .ignoresSafeArea()
                .frame(height: 350)
                .scaledToFit()
            
            Text(L10n.Onboarding.title)
                .fontWeight(.bold)
                .font(.title)
                .padding(15)
            
            Text(L10n.Onboarding.body)
                .multilineTextAlignment(.center)
                .fontWeight(.light)
                .font(.body)
            
            Spacer()
            
            RoundedButton(
                text: L10n.Onboarding.action, action: { router.push(.onboardingSelectionView) }
            )
            .padding(.bottom, 15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
    
}

#Preview {
    OnboardingView()
}
