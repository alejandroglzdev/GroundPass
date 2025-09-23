//
//  Satellites.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 21/7/25.
//

import Foundation

struct Satellite: Identifiable, Decodable, Equatable, Hashable {
    var id: Int { noradID }
    let name: String
    let noradID: Int
    
    var subtitle: String? = nil
    var imageURL: URL = URL(string: "https://via.placeholder.com/150")!
    var country: String? = nil
    var launchDate: String? = nil
    var launchLocation: String? = nil
    var apogee: String? = nil
    var perigee: String? = nil
    var inclination: String? = nil
    var period: String? = nil
    var status: String? = nil
    var typePurpose: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case noradID = "id"
        case country = "country"
        case launchDate = "launch"
        case launchLocation = "site"
        case apogee = "apogee"
        case perigee = "perigee"
        case inclination = "inc"
        case period = "period"
        case status = "active"
        case typePurpose = "type"
    }
    
    init(name: String, noradID: Int, subtitle: String? = nil, imageURL: URL = URL(string: "https://via.placeholder.com/150")!, country: String? = nil, launchDate: String? = nil, launchLocation: String? = nil, apogee: String = "", perigee: String = "", inclination: String = "", period: String = "", status: String? = nil, typePurpose: String? = nil) {
        self.name = name
        self.noradID = noradID
        self.subtitle = subtitle
        self.imageURL = imageURL
        self.country = country
        self.launchDate = launchDate
        self.launchLocation = launchLocation
        self.apogee = apogee
        self.perigee = perigee
        self.inclination = inclination
        self.period = period
        self.status = status
        self.typePurpose = typePurpose
    }

}

struct PopularSatellites {
    static let all: [Satellite] = [
        Satellite(
                name: "Hubble Space Telescope",
                noradID: 20580,
                subtitle: "Famous space telescope",
                imageURL: URL(string: "https://photojournal.jpl.nasa.gov/jpeg/PIA22574.jpg")!
            ),
            Satellite(
                name: "International Space Station",
                noradID: 25544,
                subtitle: "Habitable artificial satellite",
                imageURL: URL(string: "https://www.esa.int/var/esa/storage/images/esa_multimedia/images/2021/11/cosmic_pearl/23822292-1-eng-GB/Cosmic_pearl_pillars.jpg")!
            ),
            Satellite(
                name: "GPS IIF-1",
                noradID: 39235,
                subtitle: "Navigation satellite",
                imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/8/8d/GPS_Satellite_NASA_art-iif.jpg")!
            ),
            Satellite(
                name: "Sputnik 1",
                noradID: 00001,
                subtitle: "First artificial satellite",
                imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/b/be/Sputnik_asm.jpg")!
            ),
            Satellite(
                name: "Envisat",
                noradID: 27386,
                subtitle: "Earth observation satellite",
                imageURL: URL(string: "https://www.esa.int/var/esa/storage/images/esa_multimedia/images/2012/05/envisat/9680687-3-eng-GB/Envisat_pillars.jpg")!
            ),
            Satellite(
                name: "GOES-16",
                noradID: 41765,
                subtitle: "Weather satellite",
                imageURL: URL(string: "https://www.solaranywhere.com/wp-content/uploads/2018/02/NASA_GOES-16_Satellite_1170x585.jpg")!
            ),
            Satellite(
                name: "James Webb Space Telescope",
                noradID: 50918,
                subtitle: "Infrared space telescope",
                imageURL: URL(string: "https://webbtelescope.org/files/live/sites/webb/files/home/news/webb-science-writers-guide/telescope-overview/_images/JWST-Cold-Side.jpg")!
            ),
            Satellite(
                name: "Terra",
                noradID: 25994,
                subtitle: "Earth science satellite",
                imageURL: URL(string: "https://science.nasa.gov/wp-content/uploads/2023/06/terra-auto11-jpeg.webp")!
            ),
            Satellite(
                name: "TDRS-3",
                noradID: 17817,
                subtitle: "Communications satellite",
                imageURL: URL(string: "https://www.nasa.gov/wp-content/uploads/2020/10/1-tdrs-image-1.jpg")!
            ),
            Satellite(
                name: "Enceladus Icy Moon Explorer (JUICE)",
                noradID: 46531,
                subtitle: "ESA mission to Jupiter's moons",
                imageURL: URL(string: "https://cdn.mos.cms.futurecdn.net/wiHouwPrW6ZvYRKBxqV5hJ.jpg")!
            )
    ]
}
