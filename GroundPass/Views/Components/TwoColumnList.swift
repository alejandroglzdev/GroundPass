//
//  TwoColumnList.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 19/9/25.
//

import SwiftUI

struct TwoColumnList: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let rows: [IdentifiableView]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(rows, id: \.id) { row in
                    row.view
                }
            }
        }
    }
}
