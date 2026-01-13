//
//  BottomSheetModal.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 13/1/26.
//

import SwiftUI

struct BottomSheetModal: View {
    @Environment(\.dismiss) private var dismiss
    
    let header: String
    let bodyText: String
    let bodyTextBold: String
    let headerImage: String
    var buttonImage: String? = nil
        
    var body: some View {
        VStack {
            Image(systemName: headerImage)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding()
                .foregroundStyle(.button)
                .background(.secondaryButton)
                .clipShape(Circle())
            
            HeaderText(text: header)
            Text(bodyText)
                .multilineTextAlignment(.center)
                .padding(.vertical)
            
            Text(bodyTextBold)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            Spacer()
            
            RoundedButton(text: L10n.AboutUsModal.tipButtonText, systemImageName: buttonImage, maxWidth: .infinity, action: {
                if let url = URL(string: Constants.buyMeACoffeURL) {
                    UIApplication.shared.open(url)
                }
            })
            .padding(.vertical)
            
            Button(action: {
                dismiss()
            }) {
                Text(L10n.AboutUsModal.closeButtonText)
                    .tint(.backgroundContrasting)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 42)
    }
}
