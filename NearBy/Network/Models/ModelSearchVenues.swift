//
//  ModelSearchVenues.swift
//  NearBy
//
//  Created by Yusef Naser on 27/11/2021.
//

struct ModelSearchVenues : Codable {
    let meta: ModelMeta?
    let notifications: [ModelNotification]?
    let response: ModelResponse?
}


struct ModelMeta: Codable {
    let code: Int?
    let requestID: String?

    enum CodingKeys: String, CodingKey {
        case code
        case requestID = "requestId"
    }
}


struct ModelNotification: Codable {
    let type: String?
    let item: ModelItem?
}

struct ModelItem: Codable {
    let unreadCount: Int?
}

struct ModelResponse: Codable {
    let venues: [ModelVenue]?
}
