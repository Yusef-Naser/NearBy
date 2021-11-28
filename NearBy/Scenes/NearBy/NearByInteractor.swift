//
//  NearByInteractor.swift
//  NearBy
//
//  Created by Yusef Naser on 26/11/2021.
//VC

import Foundation

class NearByInteractor {
    
    func getPlaces (lat : Double , lng : Double , comepltion : @escaping CompletionHandler<ModelPlaces>) {
        let data: [String: String] = [
            Constants.Parameters.VERSIONING : Date().getDateWithFormatePlace() ,
            Constants.Parameters.latitude_longitude : "\(lat),\(lng)"
            
        ]
        ApiClient<ModelPlaces>.performRequest(route: .getPlaces(data: data )) { result , statusCode  in
            switch result {
            case .success(let data) :
                comepltion(data , nil , statusCode)
                return
            case .error(let error) :
                comepltion(nil, error , statusCode)
                return
            }
        }
        
    }
    
    func getPlaceImages (placeID : String , completion : @escaping CompletionHandler<[ModelPlaceImages]>) {
        ApiClient<[ModelPlaceImages]>.performRequest(route: .getImagesPlace(placeID: placeID )) { result , statusCode in
            switch result {
            case .success(let data) :
                completion(data , nil, statusCode)
                return
            case .error(let error) :
                completion(nil, error, statusCode)
                return
            }
        }
    }
    
}
