//
//  SearchBar.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 19/9/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            TextField(L10n.SearchSatelliteView.SearchBar.barPlaceholder, text: $text)
                .padding(8)
                .padding(.horizontal, 25)
                .background(Color(UIColor.backgroundSecondary))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing && !text.isEmpty {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .onTapGesture {
                    self.isEditing = true
                }
        }
    }
}

#Preview {
    @Previewable @State var searchText = ""

    SearchBar(text: $searchText)
}
