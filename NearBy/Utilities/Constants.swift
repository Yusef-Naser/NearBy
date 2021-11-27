//
//  Constants.swift
//  NearBy
//
//  Created by Yusef Naser on 27/11/2021.
//

class Constants {
    
    static var BaseURL : String {
        return "https://api.foursquare.com/v3/places"
    }
    
    static let CLIENT_ID = "P12VHXFF2XXFACB4DC0DDG344KD4B5V3H3QYTE1KTQ5N0TBN"
    static let CLIENT_SECRET = "5UTW05GXYURFSTPNCEKEFIBP3LAGMCBQFK01W330YT0PRHLC"
    static let VERSIONING = "20211101"
    static let Auth = "fsq3BeU7VhUcaJ39d7BJdp19FHUXvXpvLlpBiLdG0EQzSSE="
    
    class Parameters {
        static let clientID = "client_id"
        static let clientSecret = "client_secret"
        static let VERSIONING = "v"
        static let latitude_longitude = "ll"
        static let Authorization = "Authorization"
    }
    
}
