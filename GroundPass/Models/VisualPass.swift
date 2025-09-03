//
//  VisualPass.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 3/9/25.
//

import Foundation

struct VisualPass: Decodable, Identifiable, Equatable{
    let id = UUID()
    let noradId: Int
    let satelliteName: String
    let startAz: Double
    let startAzCompass: String
    let startEl: Double
    let startUTC: TimeInterval
    let maxAz: Double
    let maxAzCompass: String
    let maxEl: Double
    let maxUTC: TimeInterval
    let endAz: Double
    let endAzCompass: String
    let endEl: Double
    let endUTC: TimeInterval
    let mag: Double
    let duration: Int
    let startVisibility: TimeInterval
}

struct VisualPassResponse: Decodable {
    struct Pass: Decodable {
        let startAz: Double
        let startAzCompass: String
        let startEl: Double
        let startUTC: TimeInterval
        let maxAz: Double
        let maxAzCompass: String
        let maxEl: Double
        let maxUTC: TimeInterval
        let endAz: Double
        let endAzCompass: String
        let endEl: Double
        let endUTC: TimeInterval
        let mag: Double
        let duration: Int
        let startVisibility: TimeInterval
    }

    let noradId: Int
    let satelliteName: String
    let passes: [Pass]

    private enum CodingKeys: String, CodingKey {
        case info
        case passes
    }

    private enum InfoKeys: String, CodingKey {
        case satid
        case satname
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let infoContainer = try container.nestedContainer(keyedBy: InfoKeys.self, forKey: .info)
        noradId = try infoContainer.decode(Int.self, forKey: .satid)
        satelliteName = try infoContainer.decode(String.self, forKey: .satname)
        passes = try container.decode([Pass].self, forKey: .passes)
    }
}
