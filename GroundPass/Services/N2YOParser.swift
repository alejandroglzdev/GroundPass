//
//  N2YOParser.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 3/9/25.
//

import Foundation

final class N2YOParser {
    static func parse(response: Data) -> [VisualPass] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        do {
            let fullResponse = try decoder.decode(VisualPassResponse.self, from: response)

            return fullResponse.passes.map { pass in
                VisualPass(
                    noradId: fullResponse.noradId,
                    startAz: pass.startAz,
                    startAzCompass: pass.startAzCompass,
                    startEl: pass.startEl,
                    startUTC: pass.startUTC,
                    maxAz: pass.maxAz,
                    maxAzCompass: pass.maxAzCompass,
                    maxEl: pass.maxEl,
                    maxUTC: pass.maxUTC,
                    endAz: pass.endAz,
                    endAzCompass: pass.endAzCompass,
                    endEl: pass.endEl,
                    endUTC: pass.endUTC,
                    mag: pass.mag,
                    duration: pass.duration,
                    startVisibility: pass.startVisibility
                )
            }
        } catch {
            return []
        }
    }
}
