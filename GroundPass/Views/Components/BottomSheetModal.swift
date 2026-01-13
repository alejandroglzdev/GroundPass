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
    var bodyTextBold: String? = nil
    let headerImage: String
    let buttonText: String
    var buttonImage: String? = nil
    let action: () -> Void
        
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
            
            if let bodyTextBold = bodyTextBold {
                Text(bodyTextBold)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
            }
            
            Spacer()
            
            RoundedButton(text: buttonText, systemImageName: buttonImage, maxWidth: .infinity, action: {
                action()
            })
            .padding(.vertical)
            
            Button(action: {
                dismiss()
            }) {
                Text(L10n.AboutUsModal.closeButtonText)
                    .tint(.backgroundContrasting)
            }
        }
        .padding(.horizontal, 22)
        .padding(.top, 42)
    }
}
