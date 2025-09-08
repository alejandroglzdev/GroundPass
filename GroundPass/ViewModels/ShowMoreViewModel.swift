//
//  ShowMoreViewModel.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 8/9/25.
//

import SwiftUI

final class ShowMoreViewModel: ObservableObject {
    @Published var passes: [VisualPass] = []
    
    init(passes: [VisualPass]) {
        self.passes = passes
    }
}
