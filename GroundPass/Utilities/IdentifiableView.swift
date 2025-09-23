//
//  IdentifiableView.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 19/9/25.
//

import Foundation
import SwiftUI

struct IdentifiableView: Identifiable {
    let id = UUID()
    let view: AnyView
}
