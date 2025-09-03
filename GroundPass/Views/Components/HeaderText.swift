//
//  HeaderText.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 24/7/25.
//

import SwiftUI

struct HeaderText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .bold()
            .foregroundColor(.primary)
    }
}
