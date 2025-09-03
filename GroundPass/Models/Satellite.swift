//
//  Satellites.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 21/7/25.
//

import Foundation

struct Satellite: Identifiable {
    var id: Int { noradID }
    let name: String
    var subtitle: String? = nil
    let noradID: Int
    let imageURL: URL
}

struct FamousSatellites {
    static let all: [Satellite] = [
        Satellite(
                name: "Hubble Space Telescope",
                subtitle: "Famous space telescope",
                noradID: 20580,
                imageURL: URL(string: "https://photojournal.jpl.nasa.gov/jpeg/PIA22574.jpg")!
            ),
            Satellite(
                name: "International Space Station",
                subtitle: "Habitable artificial satellite",
                noradID: 25544,
                imageURL: URL(string: "https://www.esa.int/var/esa/storage/images/esa_multimedia/images/2021/11/cosmic_pearl/23822292-1-eng-GB/Cosmic_pearl_pillars.jpg")!
            ),
            Satellite(
                name: "GPS IIF-1",
                subtitle: "Navigation satellite",
                noradID: 39235,
                imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/8/8d/GPS_Satellite_NASA_art-iif.jpg")!
            ),
            Satellite(
                name: "Sputnik 1",
                subtitle: "First artificial satellite",
                noradID: 00001,
                imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/b/be/Sputnik_asm.jpg")!
            ),
            Satellite(
                name: "Envisat",
                subtitle: "Earth observation satellite",
                noradID: 27386,
                imageURL: URL(string: "https://www.esa.int/var/esa/storage/images/esa_multimedia/images/2012/05/envisat/9680687-3-eng-GB/Envisat_pillars.jpg")!
            ),
            Satellite(
                name: "GOES-16",
                subtitle: "Weather satellite",
                noradID: 41765,
                imageURL: URL(string: "https://www.solaranywhere.com/wp-content/uploads/2018/02/NASA_GOES-16_Satellite_1170x585.jpg")!
            ),
            Satellite(
                name: "James Webb Space Telescope",
                subtitle: "Infrared space telescope",
                noradID: 50918,
                imageURL: URL(string: "https://webbtelescope.org/files/live/sites/webb/files/home/news/webb-science-writers-guide/telescope-overview/_images/JWST-Cold-Side.jpg")!
            ),
            Satellite(
                name: "Terra",
                subtitle: "Earth science satellite",
                noradID: 25994,
                imageURL: URL(string: "https://science.nasa.gov/wp-content/uploads/2023/06/terra-auto11-jpeg.webp")!
            ),
            Satellite(
                name: "TDRS-3",
                subtitle: "Communications satellite",
                noradID: 17817,
                imageURL: URL(string: "https://www.nasa.gov/wp-content/uploads/2020/10/1-tdrs-image-1.jpg")!
            ),
            Satellite(
                name: "Enceladus Icy Moon Explorer (JUICE)",
                subtitle: "ESA mission to Jupiter's moons",
                noradID: 46531,
                imageURL: URL(string: "https://cdn.mos.cms.futurecdn.net/wiHouwPrW6ZvYRKBxqV5hJ.jpg")!
            )
    ]
}
