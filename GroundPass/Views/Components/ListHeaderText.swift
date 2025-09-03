//
//  ListHeaderText.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 23/7/25.
//

import SwiftUI

struct ListHeaderText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .bold()
            .foregroundColor(.primary)
            .padding(.bottom, 8)
    }
}
