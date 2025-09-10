//
//  L10N.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 17/7/25.
//

enum L10n {
    enum TabBar {
        static let home = String(localized: "tabBar.home")
    }
    
    enum Onboarding {
        static let title = String(localized: "onboarding.title")
        static let body = String(localized: "onboarding.body")
        static let action = String(localized: "onboarding.action")
    }
    
    enum OnboardingSelection {
        static let topBarTitle = String(localized: "onboardingSelection.topBarTitle")
        static let header = String(localized: "onboardingSelection.header")
        static let button = String(localized: "onboardingSelection.button")
    }
    
    enum Home {
        static let showMoreButtonText = String(localized: "home.showMoreButtonText")
    }
    
    enum ShowMore {
        static let topBarTitle = String(localized: "showMore.topBarTitle")
    }
    
    enum VisualPassDetail {
        static let button = String(localized: "visualPassDetail.button")
        static let topBarTitle = String(localized: "visualPassDetail.topBarTitle")
        
        enum DateTimeInfo {
            static let title = String(localized: "visualPassDetail.dateTimeInfo.title")
            static let startTitle = String(localized: "visualPassDetail.dateTimeInfo.start")
            static let endTitle = String(localized: "visualPassDetail.dateTimeInfo.end")
        }
        
        enum DirectionElevationInfo {
            static let title = String(localized: "visualPassDetail.directionElevationInfo.title")
            static let directionTitle = String(localized: "visualPassDetail.directionElevationInfo.directionTitle")
            static let directionText = String(localized: "visualPassDetail.directionElevationInfo.directionText")
            static let maxElevationTitle = String(localized: "visualPassDetail.directionElevationInfo.maxElevationTitle")
            static let maxElevationText = String(localized: "visualPassDetail.directionElevationInfo.maxElevationText")
        }
        
        enum DurationInfo {
            static let title = String(localized: "visualPassDetail.durationInfo.title")
            static let durationTitle = String(localized: "visualPassDetail.durationInfo.totalTitle")
        }
        
        enum SatelliteDetailInfo {
            static let title = String(localized: "visualPassDetail.satelliteDetailInfo.title")
            static let nameTitle = String(localized: "visualPassDetail.satelliteDetailInfo.nameTitle")
            static let noradIdTitle = String(localized: "visualPassDetail.satelliteDetailInfo.noradIdTitle")
        }
        
        enum VisibilityInfo {
            static let title = String(localized: "visualPassDetail.visibilityInfo.title")
            static let magnitudeTitle = String(localized: "visualPassDetail.visibilityInfo.magnitudeTitle")
            static let visibilityTitle = String(localized: "visualPassDetail.visibilityInfo.visibilityTitle")
            static let visibilityYes = String(localized: "visualPassDetail.visibilityInfo.visibilityYes")
            static let visibilityNo = String(localized: "visualPassDetail.visibilityInfo.visibilityNo")
        }
    }
    
    enum SatellitePassRow {
        static let title = String(localized: "satellitePassRow.title")
    }
}
