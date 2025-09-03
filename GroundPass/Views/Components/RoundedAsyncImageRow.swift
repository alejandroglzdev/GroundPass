//
//  RowRoundedAsyncImage.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 24/7/25.
//

import SwiftUI

struct RowRoundedAsyncImage: View {
    let imageURL: URL?
    let placeholder: String
    
    var body: some View {
        if let url = imageURL {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 70, height: 70)
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                case .failure(_):
                    Image(placeholder)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                @unknown default:
                    EmptyView()
                        .frame(width: 70, height: 70)
                }
            }
        } else {
            Image(placeholder)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}
