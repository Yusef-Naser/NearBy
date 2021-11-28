//
//  ModelPlaceImages.swift
//  NearBy
//
//  Created by Yusef Naser on 28/11/2021.
//

struct ModelPlaceImages: Codable {
    let id, createdAt: String?
    let prefix: String?
    let suffix: String?
    let width, height: Int?
    let classifications: [String]?

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case prefix = "prefix"
        case suffix, width, height, classifications
    }
}


