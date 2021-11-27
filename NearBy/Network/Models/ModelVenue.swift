//
//  ModelVenue.swift
//  NearBy
//
//  Created by Yusef Naser on 27/11/2021.
//

struct ModelVenue: Codable {
    let id, name: String?
//    let contact: Contact?
//    let location: Location?
//    let canonicalURL: String?
//    let canonicalPath: String?
//    let categories: [Category]?
//    let verified: Bool?
//    let stats: Stats?
//    let allowMenuURLEdit: Bool?
//    let beenHere: BeenHere?
//    let specials: Specials?
//    let hereNow: HereNow?
//    let referralID: String?
////    let venueChains: [JSONAny]?
//    let hasPerk: Bool?
//    let url: String?
//    let urlSig: String?
//    let hasMenu: Bool?
//    let menu: Menu?
//    let deliveryProviders: [Delivery]?
//    let delivery: Delivery?
//    let reservations: Reservations?
//    let venuePage: VenuePage?
//    let storeID: String?
//    let locked: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name
//        case contact, location
//        case canonicalURL = "canonicalUrl"
//        case canonicalPath, categories, verified, stats
//        case allowMenuURLEdit = "allowMenuUrlEdit"
//        case beenHere, specials, hereNow
//        case referralID = "referralId"
//        case hasPerk, url, urlSig, hasMenu, menu, deliveryProviders, delivery, reservations, venuePage
////        case venueChains
//        case storeID = "storeId"
//        case locked
    }
}

struct BeenHere: Codable {
    let lastCheckinExpiredAt: Int?
}

struct Category: Codable {
    let id: String?
    let name: String?
    let pluralName: String?
    let shortName: String?
    let icon: CategoryIcon?
    let primary: Bool?
}

struct CategoryIcon: Codable {
    let iconPrefix, mapPrefix: String?
    let suffix: String?

    enum CodingKeys: String, CodingKey {
        case iconPrefix = "prefix"
        case mapPrefix, suffix
    }
}

struct Contact: Codable {
    let twitter, phone, formattedPhone, facebook: String?
    let facebookUsername, facebookName, instagram: String?
}

struct Delivery: Codable {
    let id: String?
    let url: String?
    let provider: Provider?
}

struct Provider: Codable {
    let name: String?
    let icon: ProviderIcon?
}

struct ProviderIcon: Codable {
    let iconPrefix: String?
    let sizes: [Int]?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case iconPrefix = "prefix"
        case sizes, name
    }
}

struct HereNow: Codable {
    let count: Int?
    let summary: String?
    let groups: [Group]?
}

struct Group: Codable {
    let type, name: String?
    let count: Int?
    //let items: [JSONAny]?
}


struct Location: Codable {
    let address: String?
    let lat, lng: Double?
    let labeledLatLngs: [String]?
    let distance: Int?
    let postalCode: String?
    let cc: String?
    let neighborhood: String?
    let city: String?
    let state: String?
    let country: String?
    let contextLine: String?
    let contextGeoID: Int?
    let formattedAddress: [String]?
    let crossStreet: String?

    enum CodingKeys: String, CodingKey {
        case address, lat, lng, labeledLatLngs, distance, postalCode, cc, neighborhood, city, state, country, contextLine
        case contextGeoID = "contextGeoId"
        case formattedAddress, crossStreet
    }
}

struct Menu: Codable {
    let type, label: String?
    let anchor: String?
    let url, mobileURL: String?
    let canonicalPath: String?
    let externalURL: String?

    enum CodingKeys: String, CodingKey {
        case type, label, anchor, url
        case mobileURL = "mobileUrl"
        case canonicalPath
        case externalURL = "externalUrl"
    }
}


struct Reservations: Codable {
    let url: String?
    let provider, id: String?
}

struct Specials: Codable {
    let count: Int?
   // let items: [JSONAny]?
}


struct Stats: Codable {
    let tipCount, usersCount, checkinsCount: Int?
}

struct VenuePage: Codable {
    let id: String?
}
