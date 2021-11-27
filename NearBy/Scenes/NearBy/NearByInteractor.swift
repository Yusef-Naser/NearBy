//
//  NearByInteractor.swift
//  NearBy
//
//  Created by Yusef Naser on 26/11/2021.
//VC


class NearByInteractor {
    
    func getVenues (lat : Double , lng : Double , comepltion : @escaping CompletionHandler<ModelPlaces>) {
        let data: [String: String] = [
            Constants.Parameters.VERSIONING : Constants.VERSIONING ,
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
    
}
