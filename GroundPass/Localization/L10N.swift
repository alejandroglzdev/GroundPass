//
//  L10N.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 17/7/25.
//

enum L10n {
    enum TabBar {
        static let home = String(localized: "tabBar.home")
        static let satellites = String(localized: "tabBar.satellites")
        static let settings = String(localized: "tabBar.settings")
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
            static let visibilityDifficult = String(localized: "visualPassDetail.visibilityInfo.visibilityDifficult")
            static let visibilityNo = String(localized: "visualPassDetail.visibilityInfo.visibilityNo")
        }
    }
    
    enum SatellitePassRow {
        static let title = String(localized: "satellitePassRow.title")
    }
    
    enum SearchSatelliteView {
        static let popularSatelliteTitle = String(localized: "searchSatelliteView.popularSatelliteTitle")
        static let searchedSatelliteTitle = String(localized: "searchSatelliteView.searchedSatelliteTitle")
        static let noSatelliteFoundBody = String(localized: "searchSatelliteView.noSatelliteFoundBody")
        
        enum SearchBar {
            static let barPlaceholder = String(localized: "searchSatelliteView.searchBar.barPlaceholder")
        }
    }
    
    enum Extensions {
        enum Int {
            static let formatMinuteSeconds = String(localized: "extensions.int.formatMinuteSeconds")
        }
    }
    
    enum SatelliteDetail {
        static let topBarTitle = String(localized: "satelliteDetail.topBarTitle")
        static let unknown = String(localized: "satelliteDetail.unknown")
        static let addFavouriteButtonText = String(localized: "satelliteDetail.addFavouriteButtonText")
        static let deleteFavouriteButtonText = String(localized: "satelliteDetail.deleteFavouriteButtonText")
        
        enum LaunchInfo {
            static let title = String(localized: "satelliteDetail.launchInfo.title")
            static let dateTitle = String(localized: "satelliteDetail.launchInfo.dateTitle")
            static let locationTitle = String(localized: "satelliteDetail.launchInfo.locationTitle")
        }
        
        enum OrbitInfo {
            static let title = String(localized: "satelliteDetail.orbitInfo.title")
            static let apogeeTitle = String(localized: "satelliteDetail.orbitInfo.apogeeTitle")
            static let perigeeTitle = String(localized: "satelliteDetail.orbitInfo.perigeeTitle")
            static let inclinationTitle = String(localized: "satelliteDetail.orbitInfo.inclinationTitle")
            static let periodTitle = String(localized: "satelliteDetail.orbitInfo.periodTitle")
            static let apogeeText = String(localized: "satelliteDetail.orbitInfo.apogeeText")
            static let perigeeText = String(localized: "satelliteDetail.orbitInfo.perigeeText")
            static let inclinationText = String(localized: "satelliteDetail.orbitInfo.inclinationText")
            static let periodText = String(localized: "satelliteDetail.orbitInfo.periodText")
        }
        
        enum SatelliteDetailHeader {
            static let subtitle = String(localized: "satelliteDetail.satelliteDetailHeader.subtitle")
        }
        
        enum StatusInfo {
            static let title = String(localized: "satelliteDetail.statusInfo.title")
            static let statusTitle = String(localized: "satelliteDetail.statusInfo.statusTitle")
            static let typePurposeTitle = String(localized: "satelliteDetail.statusInfo.typePurposeTitle")
            static let active = String(localized: "satelliteDetail.statusInfo.active")
            static let inactive = String(localized: "satelliteDetail.statusInfo.inactive")
        }
    }
    
    enum SettingsView {
        static let title = String(localized: "settingsView.title")
        
        enum GeneralSection {
            static let title = String(localized: "settingsView.generalSection.title")
            static let manageFavouriteSatellitesButton = String(localized: "settingsView.generalSection.manageFavouriteSatellitesButton")
        }
        
        enum AboutSection {
            static let title = String(localized: "settingsView.aboutSection.title")
            static let aboutUsButton = String(localized: "settingsView.aboutSection.aboutUsButton")
        }
    }
    
    enum ManageFavouriteSatellitesView {
        static let title = String(localized: "manageFavouriteSatellitesView.title")
        static let maxFavouriteSatellitesWarning = String(localized: "manageFavouriteSatellitesView.maxFavouriteSatellitesWarning")
    }
}
