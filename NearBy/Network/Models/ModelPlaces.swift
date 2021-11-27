//
//  ModelPlaces.swift
//  NearBy
//
//  Created by Yusef Naser on 27/11/2021.
//

struct ModelPlaces : Codable {
    let results: [ModelResult]?
    let context: ModelContext?
}


struct ModelContext: Codable {
    let geoBounds: GeoBounds?

    enum CodingKeys: String, CodingKey {
        case geoBounds = "geo_bounds"
    }
}

struct GeoBounds: Codable {
    let circle: Circle?
}

struct Circle: Codable {
    let center: Center?
    let radius: Int?
}

struct Center: Codable {
    let latitude, longitude: Double?
}

struct ModelResult: Codable {
    let fsqID: String?
    let categories: [ModelCategory]?
//    let chains: [JSONAny]?
    let distance: Int?
    let geocodes: Geocodes?
    let location: ModelLocation?
    let name: String?
    let relatedPlaces: RelatedPlaces?
    let timezone: String?

    enum CodingKeys: String, CodingKey {
        case fsqID = "fsq_id"
        case categories, distance, geocodes, location, name
        //case chains
        case relatedPlaces = "related_places"
        case timezone
    }
}


struct ModelCategory: Codable {
    let id: Int?
    let name: String?
    let icon: Icon?
}

struct Icon: Codable {
    let iconPrefix: String?
    let suffix: String?

    enum CodingKeys: String, CodingKey {
        case iconPrefix = "prefix"
        case suffix
    }
}

struct Geocodes: Codable {
    let main: Center?
}


struct ModelLocation: Codable {
    let address: String?
    let country: String?
    let crossStreet: String?
    let dma, locality: String?
    let neighborhood: [String]?
    let postcode: String?
    let region: String?

    enum CodingKeys: String, CodingKey {
        case address, country
        case crossStreet = "cross_street"
        case dma, locality, neighborhood, postcode, region
    }
}


struct RelatedPlaces: Codable {
    let parent: Parent?
    let children: [Parent]?
}

struct Parent: Codable {
    let fsqID, name: String?

    enum CodingKeys: String, CodingKey {
        case fsqID = "fsq_id"
        case name
    }
}
