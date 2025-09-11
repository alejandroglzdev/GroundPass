//
//  NavigationRouter.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 17/7/25.
//

import Foundation
import SwiftUI
import Combine

enum Route: Hashable {
    case onboardingView
    case onboardingSelectionView
    case mainView
    case showMoreView(_ passes: [VisualPass])
    case visualPassDetail(_ pass: VisualPass)
}

class NavigationRouter: ObservableObject {
    @Published var path = NavigationPath()

    func push(_ route: Route) {
        path.append(route)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func setRoot(_ route: Route) {
        path = NavigationPath()
        path.append(route)
    }
    
    func clearRoot() {
        path = NavigationPath()
    }
}
